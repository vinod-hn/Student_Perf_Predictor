@echo off
echo 🚀 Student Performance Predictor - Windows Deployment Helper
echo ============================================================
echo.

echo Checking requirements...

REM Check if Git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is not installed. Please install Git first:
    echo    Visit: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✅ Git is installed

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed. Please install Python first:
    echo    Visit: https://python.org/downloads/
    pause
    exit /b 1
)

echo ✅ Python is installed

echo.
echo 📋 Deployment preparation...

REM Run preparation script
python prepare_deployment.py

echo.
echo 🎯 Choose your deployment platform:
echo.
echo 1. Heroku (Recommended for beginners)
echo 2. Railway (Modern and fast)
echo 3. Render (Professional hosting)
echo 4. Manual setup instructions
echo.

set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo 🔗 Opening Heroku deployment guide...
    echo.
    echo Follow these steps:
    echo 1. Create account at: https://heroku.com
    echo 2. Install Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
    echo 3. Run: heroku login
    echo 4. Run: heroku create your-app-name
    echo 5. Run: git push heroku main
    echo.
    start https://heroku.com
) else if "%choice%"=="2" (
    echo.
    echo 🚄 Opening Railway deployment...
    echo.
    echo Follow these steps:
    echo 1. Go to: https://railway.app
    echo 2. Sign up with GitHub
    echo 3. Click "Deploy from GitHub repo"
    echo 4. Select your repository
    echo.
    start https://railway.app
) else if "%choice%"=="3" (
    echo.
    echo ⚡ Opening Render deployment...
    echo.
    echo Follow these steps:
    echo 1. Go to: https://render.com
    echo 2. Create account and connect GitHub
    echo 3. Choose "Web Service"
    echo 4. Configure and deploy
    echo.
    start https://render.com
) else if "%choice%"=="4" (
    echo.
    echo 📖 Opening deployment guide...
    start DEPLOYMENT_GUIDE.md
) else (
    echo ❌ Invalid choice
    pause
    exit /b 1
)

echo.
echo 🎉 Deployment helper completed!
echo 📚 Check DEPLOYMENT_GUIDE.md for detailed instructions
echo.
pause
