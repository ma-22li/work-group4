from dataclasses import field
from pyexpat import model
from django import forms 
from .models import Round

class RoundForm (forms.ModelForm):
    class Meta:
        model = Round
        field=["title","mosque","type","date","category"]