#!/usr/bin/env python
"""
Quick test script to verify Django installation and basic functionality
"""

try:
    import django
    print(f"✅ Django is installed - Version: {django.get_version()}")
    
    import joblib
    print("✅ Joblib is available")
    
    import numpy
    print("✅ NumPy is available")
    
    import sklearn
    print("✅ Scikit-learn is available")
    
    print("\n🎉 All required packages are installed!")
    print("\nNext steps:")
    print("1. Run: python manage.py makemigrations")
    print("2. Run: python manage.py migrate")
    print("3. Run: python manage.py runserver")
    
except ImportError as e:
    print(f"❌ Missing package: {e}")
    print("\nPlease install missing packages:")
    print("pip install django joblib numpy scikit-learn")
