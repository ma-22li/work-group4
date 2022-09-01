from django.db import models

# Create your models here.
class User(models.Model):
    email= models.EmailField(max_length= 254)
    password= models.CharField(max_length= 50)
