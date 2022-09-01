from django.contrib.auth import  authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from login.forms import LoginForm

# Create your views here.
def login(request):
    if request.method=='POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            form.save()
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')

            user = authenticate(email=email,password=password)

            return redirect('/')
    
    else:
        form = LoginForm()
        return render (request,'login.html',{'form':form})

def home(req):
    return render(req,'home.html')