#!/usr/bin/env python
"""
Django Application Startup Guide
Run this after your Django server is running
"""

import webbrowser
import time

def open_application():
    """Open the Django application in the default browser"""
    
    print("🚀 Django Student Performance Predictor")
    print("=" * 50)
    print()
    
    # Application URLs
    urls = {
        "Login Page": "http://127.0.0.1:8000/login/",
        "Register Page": "http://127.0.0.1:8000/register/",
        "Home Page (requires login)": "http://127.0.0.1:8000/",
        "Dashboard (requires login)": "http://127.0.0.1:8000/dashboard/"
    }
    
    print("📋 Available Pages:")
    for name, url in urls.items():
        print(f"   • {name}: {url}")
    
    print()
    print("🔑 Authentication Features:")
    print("   • User Registration with validation")
    print("   • User Login/Logout")
    print("   • Password strength requirements")
    print("   • Email uniqueness validation")
    print("   • User dashboard with prediction history")
    
    print()
    print("📊 Prediction Features:")
    print("   • AI-powered performance prediction")
    print("   • Study hours and previous scores input")
    print("   • Historical prediction tracking")
    print("   • Beautiful responsive design")
    
    print()
    print("🌐 To access your application:")
    print("1. Make sure Django server is running (python manage.py runserver)")
    print("2. Open your browser and go to: http://127.0.0.1:8000/login/")
    print("3. Register a new account or login")
    print("4. Start making predictions!")
    
    # Try to open the login page automatically
    try:
        print()
        print("🔄 Opening login page in your default browser...")
        webbrowser.open("http://127.0.0.1:8000/login/")
        print("✅ Browser opened successfully!")
    except Exception as e:
        print(f"❌ Could not open browser automatically: {e}")
        print("Please manually open: http://127.0.0.1:8000/login/")

if __name__ == "__main__":
    open_application()
