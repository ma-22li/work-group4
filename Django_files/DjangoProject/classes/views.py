from django.shortcuts import render
from .models import Round
from .forms import RoundForm
from django.contrib import messages


def classes(request):
    if request.method =='POST':
        form = RoundForm(request.POST or None )

        if form.is_valid():
            form.save()
            all_items = Round.objects.all
            messages.SUCCESS(request,('Has been added To Classes'))
            return render (request,'home.html',{'all_items':all_items})

    else:
        all_items = Round.objects.all
        return render (request,'home.html',{'all_items':all_items})
