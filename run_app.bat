@echo off
cls
echo =====================================
echo   Student Performance Predictor
echo =====================================
echo.
echo 🌐 LIVE VERSION: https://web-production-49d9.up.railway.app
echo.
echo Starting LOCAL development server...
echo.

REM Activate virtual environment
call venv\Scripts\activate.bat 2>nul

REM Start server
echo Local server: http://127.0.0.1:8000/
echo.
echo Press Ctrl+C to stop the server
echo.

python manage.py runserver 127.0.0.1:8000
