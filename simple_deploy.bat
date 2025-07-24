@echo off
cls
echo 🚀 SUPER SIMPLE DEPLOYMENT - Student Performance Predictor
echo =========================================================
echo.
echo This will help you deploy your app for FREE in 5 minutes!
echo.
echo 📋 What you need:
echo   ✅ GitHub account (free)
echo   ✅ Your project (already ready!)
echo   ✅ 5 minutes of your time
echo.
pause

echo 🔄 Step 1: Checking if Git is ready...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git not found. Installing Git...
    start https://git-scm.com/download/win
    echo Please install Git and run this script again.
    pause
    exit /b 1
)
echo ✅ Git is ready!

echo.
echo 🔄 Step 2: Preparing your code for deployment...
git init >nul 2>&1
git add . >nul 2>&1
git commit -m "Ready for deployment" >nul 2>&1
echo ✅ Code prepared!

echo.
echo 🌐 Step 3: Choose your deployment platform:
echo.
echo 1. Railway (RECOMMENDED - Easiest)
echo 2. Render (Alternative - Also easy)
echo 3. Show me manual steps
echo.
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" (
    echo.
    echo 🚂 Opening Railway deployment...
    echo.
    echo STEPS TO FOLLOW:
    echo 1. Create GitHub account/login at github.com
    echo 2. Create new repository named: student-performance-predictor
    echo 3. Upload your code to GitHub
    echo 4. Go to railway.app and login with GitHub
    echo 5. Click "Deploy from GitHub repo"
    echo 6. Select your repository
    echo 7. Your app will be LIVE automatically!
    echo.
    start https://railway.app
    start https://github.com/new
) else if "%choice%"=="2" (
    echo.
    echo ⚡ Opening Render deployment...
    echo.
    echo STEPS TO FOLLOW:
    echo 1. Create GitHub account and upload your code
    echo 2. Go to render.com and signup
    echo 3. Connect GitHub and select your repo
    echo 4. Use these settings:
    echo    - Build: pip install -r requirements.txt ^&^& python manage.py collectstatic --noinput
    echo    - Start: gunicorn Student_Perf_Predictor.wsgi:application
    echo 5. Deploy and your app is LIVE!
    echo.
    start https://render.com
    start https://github.com/new
) else if "%choice%"=="3" (
    echo.
    echo 📖 Opening detailed instructions...
    start SIMPLE_DEPLOY.md
) else (
    echo ❌ Invalid choice
    pause
    exit /b 1
)

echo.
echo 🎉 Deployment helper completed!
echo 📱 Your app will be live at a custom URL in 5 minutes!
echo 🌍 Share the URL with everyone to use your AI predictor!
echo.
echo 💡 TIP: Bookmark the URL - it's your live app!
echo.
pause
