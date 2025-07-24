from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.models import User
from django.db import IntegrityError

# Create your views here.
import joblib
import numpy as np
from . import models
from . models import Prediction 
from .form import UserRegistrationForm, UserLoginForm

lgr = joblib.load('performance_predictor/LGR.pkl')

@login_required
def home(request):
    if request.method == 'POST':
        study_hours = float(request.POST.get('study_hours', 0))
        previous_scores = float(request.POST.get('previous_scores', 0))
        x = [[study_hours, previous_scores]]
        pred = int(lgr.predict(x)) 
        Prediction.objects.create(
            user=request.user,
            study_hours=study_hours,
            previous_scores=previous_scores,
            predicted=pred
        )
        return render(request, 'performace_predictor/home.html', {'pred': pred})
    
    # Handle GET requests (initial page load)
    return render(request, 'performace_predictor/home.html')

def register_view(request):
    if request.user.is_authenticated:
        return redirect('home')
    
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            try:
                user = form.save()
                username = form.cleaned_data.get('username')
                messages.success(request, f'Account created successfully for {username}! You can now log in.')
                return redirect('login')
            except IntegrityError:
                messages.error(request, 'An error occurred while creating your account. Please try again.')
        else:
            for field, errors in form.errors.items():
                for error in errors:
                    messages.error(request, f'{field.title()}: {error}')
    else:
        form = UserRegistrationForm()
    
    return render(request, 'performace_predictor/register.html', {'form': form})

def login_view(request):
    if request.user.is_authenticated:
        return redirect('home')
    
    if request.method == 'POST':
        form = UserLoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            
            user = authenticate(request, username=username, password=password)
            
            if user is not None:
                login(request, user)
                messages.success(request, f'Welcome back, {user.first_name or user.username}!')
                next_page = request.GET.get('next', 'home')
                return redirect(next_page)
            else:
                messages.error(request, 'Invalid username or password.')
        else:
            for field, errors in form.errors.items():
                for error in errors:
                    messages.error(request, error)
    else:
        form = UserLoginForm()
    
    return render(request, 'performace_predictor/login.html', {'form': form})

def logout_view(request):
    logout(request)
    messages.success(request, 'You have been successfully logged out.')
    return redirect('login')

def dashboard_view(request):
    if not request.user.is_authenticated:
        return redirect('login')
    
    # Get user's prediction history (base queryset)
    user_predictions = Prediction.objects.filter(user=request.user).order_by('-timestamp')
    
    # Get recent predictions for display
    predictions = user_predictions[:10]
    
    # Get latest prediction for stats
    latest_prediction = user_predictions.first() if user_predictions.exists() else None
    
    # Calculate excellent scores count from all predictions
    excellent_count = user_predictions.filter(predicted__gte=80).count()
    
    # Calculate total predictions count
    total_predictions = user_predictions.count()
    
    context = {
        'predictions': predictions,
        'latest_prediction': latest_prediction,
        'user': request.user,
        'excellent_count': excellent_count,
        'total_predictions': total_predictions
    }
    
    return render(request, 'performace_predictor/dashboard.html', context)