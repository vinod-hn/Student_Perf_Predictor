#!/usr/bin/env python
"""
Deployment preparation script
"""

import os
import subprocess
import sys

def run_command(command, description):
    """Run a command and handle errors"""
    print(f"\n🔄 {description}...")
    try:
        subprocess.run(command, shell=True, check=True)
        print(f"✅ {description} completed successfully!")
    except subprocess.CalledProcessError as e:
        print(f"❌ Error during {description}: {e}")
        return False
    return True

def prepare_for_deployment():
    """Prepare the Django app for deployment"""
    print("🚀 Preparing Student Performance Predictor for Deployment")
    print("=" * 60)
    
    # Check if we're in the right directory
    if not os.path.exists('manage.py'):
        print("❌ Error: manage.py not found. Please run this from your project directory.")
        return False
    
    # Install production dependencies
    if not run_command("pip install -r requirements.txt", "Installing production dependencies"):
        return False
    
    # Collect static files
    if not run_command("python manage.py collectstatic --noinput", "Collecting static files"):
        return False
    
    # Run migrations
    if not run_command("python manage.py migrate", "Running database migrations"):
        return False
    
    # Test the production setup
    print("\n🧪 Testing production setup...")
    try:
        os.environ['DJANGO_SETTINGS_MODULE'] = 'Student_Perf_Predictor.settings_production'
        if not run_command("python manage.py check --deploy", "Running deployment checks"):
            print("⚠️  Some deployment checks failed, but you can still deploy.")
    except:
        print("⚠️  Could not run deployment checks, but continuing...")
    
    print("\n🎉 Deployment preparation completed!")
    print("\nNext steps:")
    print("1. Choose a hosting platform (see deployment guide)")
    print("2. Create a .env file with your production settings")
    print("3. Push your code to Git repository")
    print("4. Deploy to your chosen platform")
    
    return True

if __name__ == "__main__":
    prepare_for_deployment()
