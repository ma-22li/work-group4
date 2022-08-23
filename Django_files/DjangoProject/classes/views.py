from django.shortcuts import render
from .models import Round
from .forms import RoundForm
from django.contrib import messages


def classes(request):
    if request.method =='POST':
        form = RoundForm(request.POST or None )

        if form.is_valid():
            form.save()
            
            title = form.cleaned_data.get('title')
            mosque = form.cleaned_data.get('mosque')
            type = form.cleaned_data.get('type')
            date = form.cleaned_data.get('date')
            category=form.cleaned_data.get('category')
            
            messages.SUCCESS(request,('Has been added To Classes'))
            return render (request,'base.html',{'form':form})

    else:
       form = RoundForm()
       return render (request,'classes.html',{'form':form})
