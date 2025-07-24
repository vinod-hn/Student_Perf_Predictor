# 🚀 Student Performance Predictor - Deployment Guide

## Quick Start - Choose Your Platform

### Option 1: 🆓 **Heroku (Easiest - Free Tier Available)**
**Perfect for beginners, one-click deployment**

#### Step 1: Setup Heroku Account
1. Go to [heroku.com](https://heroku.com) and create a free account
2. Download and install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

#### Step 2: Prepare Your Code
```bash
# Run the preparation script
python prepare_deployment.py

# Initialize git repository (if not already done)
git init
git add .
git commit -m "Initial commit for deployment"
```

#### Step 3: Deploy to Heroku
```bash
# Login to Heroku
heroku login

# Create a new Heroku app (replace 'your-app-name' with your desired name)
heroku create your-student-predictor-app

# Set environment variables
heroku config:set SECRET_KEY="your-secret-key-here"
heroku config:set DEBUG=False
heroku config:set DJANGO_SETTINGS_MODULE=Student_Perf_Predictor.settings_production

# Deploy your app
git push heroku main

# Run migrations on Heroku
heroku run python manage.py migrate

# Open your deployed app
heroku open
```

**Your app will be live at:** `https://your-student-predictor-app.herokuapp.com`

---

### Option 2: 🌐 **Railway (Modern & Fast)**
**Great performance, easy setup**

#### Step 1: Setup Railway
1. Go to [railway.app](https://railway.app) and sign up with GitHub
2. Click "Deploy from GitHub repo"
3. Connect your repository

#### Step 2: Environment Variables
Add these in Railway dashboard:
```
SECRET_KEY=your-secret-key-here
DEBUG=False
DJANGO_SETTINGS_MODULE=Student_Perf_Predictor.settings_production
```

#### Step 3: Deploy
Railway automatically deploys when you push to GitHub!

---

### Option 3: ⚡ **Render (Fast & Reliable)**
**Professional hosting with good free tier**

#### Step 1: Setup Render
1. Go to [render.com](https://render.com) and create account
2. Connect your GitHub repository
3. Choose "Web Service"

#### Step 2: Configure Service
- **Build Command:** `pip install -r requirements.txt && python manage.py collectstatic --noinput && python manage.py migrate`
- **Start Command:** `gunicorn Student_Perf_Predictor.wsgi:application`
- **Environment Variables:**
  ```
  SECRET_KEY=your-secret-key-here
  DEBUG=False
  DJANGO_SETTINGS_MODULE=Student_Perf_Predictor.settings_production
  ```

---

### Option 4: 🔥 **Firebase Hosting + Cloud Run**
**Google's platform, great for scaling**

#### Step 1: Setup Firebase
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
```

#### Step 2: Deploy to Cloud Run
```bash
gcloud run deploy student-predictor \
  --source . \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

---

## 📋 **Pre-Deployment Checklist**

### ✅ **Essential Steps**
- [ ] Run `python prepare_deployment.py`
- [ ] Create `.env` file with production settings
- [ ] Test locally with production settings
- [ ] Commit all changes to Git
- [ ] Choose hosting platform
- [ ] Set environment variables on hosting platform

### 🔐 **Security Checklist** 
- [ ] Generate new SECRET_KEY for production
- [ ] Set DEBUG=False
- [ ] Configure ALLOWED_HOSTS properly
- [ ] Review user permissions

### 🎯 **Performance Checklist**
- [ ] Static files configured (whitenoise)
- [ ] Database migrations ready
- [ ] ML model file (LGR.pkl) included in deployment

---

## 🌍 **Custom Domain Setup**

### For Heroku:
```bash
heroku domains:add www.yourdomain.com
heroku domains:add yourdomain.com
```

### For Railway/Render:
- Go to your platform's dashboard
- Add custom domain in settings
- Configure DNS records as instructed

---

## 📊 **Monitoring & Maintenance**

### View Logs:
```bash
# Heroku
heroku logs --tail

# Railway - check dashboard
# Render - check dashboard
```

### Database Management:
```bash
# Run migrations after updates
heroku run python manage.py migrate  # For Heroku

# Create admin user
heroku run python manage.py createsuperuser
```

---

## 🔧 **Environment Variables Reference**

| Variable | Development | Production |
|----------|-------------|------------|
| SECRET_KEY | Default key | Generate new secure key |
| DEBUG | True | False |
| ALLOWED_HOSTS | localhost,127.0.0.1 | yourdomain.com |
| DATABASE_URL | SQLite local | Platform provided |

---

## 🆘 **Troubleshooting**

### Common Issues:

**1. Static files not loading:**
```bash
python manage.py collectstatic --noinput
```

**2. Database errors:**
```bash
python manage.py migrate
```

**3. Import errors:**
- Ensure all dependencies in requirements.txt
- Check Python version compatibility

**4. SECRET_KEY errors:**
- Generate new key: `python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`

---

## 🎉 **Your App Features After Deployment**

✅ **User Authentication System**
- Registration with simple password requirements
- Login/Logout functionality
- User dashboard

✅ **AI-Powered Predictions**
- Machine learning model for performance prediction
- Historical tracking
- Beautiful statistics dashboard

✅ **Responsive Design**
- Works on desktop, tablet, and mobile
- Modern glass-morphism UI
- Interactive animations

✅ **Production Ready**
- Secure configuration
- Static file serving
- Database migrations
- Error handling

---

## 📞 **Support**

If you encounter issues:
1. Check platform-specific documentation
2. Review error logs
3. Verify environment variables
4. Test locally first

**Your Student Performance Predictor will be live and accessible to everyone worldwide! 🌍**
