from django.contrib.auth import  authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from signUpPage.forms import SignupForm

# Create your views here.
def signup(request):
    if request.method=='POST':
        form = SignupForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            termsOfUse = form.cleaned_data.get('termsOfUse')

            user = authenticate(username=username,email=email,password=password,termsOfUse=termsOfUse)

            return redirect('/')
    
    else:
        form = SignupForm()
        return render (request,'signup.html',{'form':form})

def home(req):
    return render(req,'home.html')