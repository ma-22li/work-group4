from django import forms
from django.contrib.auth.models import User 

#Creating Signup Form with three fields
class SignupForm( forms.ModelForm ):

    username = forms.CharField(max_length= 50)
    email = forms.EmailField( max_length= 254, help_text='example@email.com')
    password= forms.CharField(max_length= 50, widget= forms.PasswordInput)
    termsOfUse= forms.BooleanField()

    class Meta:
        model = User
        fields = ['username', 'email','password','termsOfUse']
        
    