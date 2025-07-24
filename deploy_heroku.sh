#!/bin/bash

# Quick deployment script for Heroku
echo "🚀 Quick Heroku Deployment Script"
echo "=================================="

# Check if Heroku CLI is installed
if ! command -v heroku &> /dev/null; then
    echo "❌ Heroku CLI is not installed. Please install it first:"
    echo "   Visit: https://devcenter.heroku.com/articles/heroku-cli"
    exit 1
fi

# Get app name from user
read -p "Enter your Heroku app name: " APP_NAME

if [ -z "$APP_NAME" ]; then
    echo "❌ App name cannot be empty"
    exit 1
fi

echo "🔄 Preparing deployment..."

# Generate a secret key
SECRET_KEY=$(python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())")

# Initialize git if not already done
if [ ! -d ".git" ]; then
    git init
    git add .
    git commit -m "Initial commit for deployment"
fi

# Login to Heroku
echo "🔐 Logging into Heroku..."
heroku login

# Create Heroku app
echo "🏗️  Creating Heroku app: $APP_NAME"
heroku create $APP_NAME

# Set environment variables
echo "⚙️  Setting environment variables..."
heroku config:set SECRET_KEY="$SECRET_KEY" --app $APP_NAME
heroku config:set DEBUG=False --app $APP_NAME
heroku config:set DJANGO_SETTINGS_MODULE=Student_Perf_Predictor.settings_production --app $APP_NAME

# Deploy to Heroku
echo "🚀 Deploying to Heroku..."
git push heroku main

# Run migrations
echo "🗄️  Running database migrations..."
heroku run python manage.py migrate --app $APP_NAME

# Collect static files
echo "🎨 Collecting static files..."
heroku run python manage.py collectstatic --noinput --app $APP_NAME

echo ""
echo "🎉 Deployment completed successfully!"
echo "📱 Your app is live at: https://$APP_NAME.herokuapp.com"
echo ""
echo "🔧 Useful commands:"
echo "   View logs: heroku logs --tail --app $APP_NAME"
echo "   Open app: heroku open --app $APP_NAME"
echo "   Run shell: heroku run python manage.py shell --app $APP_NAME"
