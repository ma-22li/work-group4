from django import forms 
from .models import Round

class RoundForm (forms.ModelForm):
    title = forms.TextInput()
    mosque = forms.TextInput()
    type = forms.TextInput()
    date = forms.DateTimeField()
    category=forms.TextInput()
    class Meta:
        model = Round
        fields=["title","mosque","type","date","category"]