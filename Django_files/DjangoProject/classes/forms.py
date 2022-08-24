from django import forms 
from .models import Round
from django.forms import ModelForm


category_choices = (
            ('Older', 'Older'),
            ('Younger', 'Younger'),
            )
type_choices = (
            ('online', 'Online'),
            ('Physically', 'Physically'),
            )
class RoundForm (forms.ModelForm):
    title = forms.TextInput()
    mosque = forms.TextInput()
    date = forms.DateTimeField()
    type = forms.ChoiceField(choices=type_choices, widget=forms.RadioSelect)
    category = forms.ChoiceField(choices=category_choices, widget=forms.RadioSelect)

    class Meta:
        model = Round
        fields=["title","mosque","type","date","category"]
        
    


