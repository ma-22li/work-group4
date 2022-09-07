from typing import ValuesView
from django import views
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
  #path('',views.home,name='home'),
  path('profile', views.profile, name='profile'),

]