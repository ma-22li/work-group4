from django.contrib.auth import  authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect

# Create your views here.
def signup(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method=='POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaand_data.get('password1')
            user = authenticate(username=username,password=password)

            return redirect('/')
        else:
            return render(request,'signup.html',{'form':form})
    else:
        form = UserCreationForm()
        return render (request,'signup.html',{'form':form})

def home(req):
    return render(req,'home.html')