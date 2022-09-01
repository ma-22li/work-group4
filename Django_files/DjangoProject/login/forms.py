from django import forms
from django.contrib.auth.models import User 

#Creating Signup Form with three fields
class LoginForm( forms.ModelForm ):
    email = forms.EmailField( max_length= 254)
    password= forms.CharField(max_length= 50, widget= forms.PasswordInput)
   
    class Meta:
        model = User
        fields = [ 'email','password']
    