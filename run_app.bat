@echo off
cls
echo =====================================
echo   Student Performance Predictor
echo =====================================
echo.
echo Starting Django server...
echo.

REM Activate virtual environment
call venv\Scripts\activate.bat 2>nul

REM Start server
echo Server will be available at: http://127.0.0.1:8000/login/
echo.
echo 🚀 Features:
echo    - Simple registration (username + password only)
echo    - AI-powered performance prediction  
echo    - User dashboard with history
echo    - Beautiful responsive design
echo.
echo Press Ctrl+C to stop the server
echo.

python manage.py runserver 127.0.0.1:8000
