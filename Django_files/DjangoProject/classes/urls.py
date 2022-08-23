from django import views
from django.http import HttpResponse
from django.urls import URLPattern, path
from . import views

urlpatterns = [   
    path('',views.home,name='home'),
    path('classes/',views.classes, name='classes')
]