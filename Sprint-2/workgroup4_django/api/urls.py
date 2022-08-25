from django.urls import path
from .views import UserDetailAPI,RegisterUserAPIView,PostCreateAPIView
from django.views.generic import TemplateView
from . import views

urlpatterns = [
  path('', TemplateView.as_view(template_name="index.html")),
  path("get-details",UserDetailAPI.as_view()),
  path('register',RegisterUserAPIView.as_view()),
  path('createCircute', PostCreateAPIView.as_view()),
]