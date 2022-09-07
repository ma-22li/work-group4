from contextlib import _RedirectStream
from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model
from .forms import UserUpdateForm


# Create your views here.

def profile(request, username):
    if request.method == 'POST':
        pass

    user = get_user_model().objects.filter(username=username).first()
    if user:
        form = UserUpdateForm(instance=user)
        return render(request, 'users/profile.html', context={'form': form})

    #return _RedirectStream("home")
    return redirect('/home.html')
   
   