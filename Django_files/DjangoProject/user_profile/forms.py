from django import forms
from django.contrib.auth.models import User 
from django.contrib.auth import get_user_model
from django.db import models


class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()
    Place_of_residence = models.TextField(max_length=200)
    Gender = (('male', 'male'),
    ('female', 'female'))
    gender = models.CharField(
       max_length=32,
       choices= Gender,
       default='male',
   )
    age = models.IntegerField()

    class Meta:
        model = get_user_model()
        fields = ['first_name', 'last_name', 'email']