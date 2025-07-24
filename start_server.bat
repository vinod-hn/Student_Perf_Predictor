@echo off
echo Starting Django Student Performance Predictor...
echo.

REM Activate virtual environment
call venv\Scripts\activate.bat

echo Virtual environment activated.
echo.

REM Check Django installation
python -c "import django; print('Django version:', django.get_version())"
echo.

REM Run migrations
echo Running database migrations...
python manage.py makemigrations --noinput
python manage.py migrate --noinput
echo.

REM Start the server
echo Starting Django development server...
echo.
echo Open your browser and go to: http://127.0.0.1:8000/login/
echo.
echo Press Ctrl+C to stop the server
echo.

python manage.py runserver 127.0.0.1:8000
