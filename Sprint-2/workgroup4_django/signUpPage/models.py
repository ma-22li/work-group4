from django.db import models

# Create your models here.
class User(models.Model):
    username= models.CharField(max_length=50)
    email= models.EmailField(max_length= 254, help_text='example@email.com')
    password= models.CharField(max_length= 50)
    termsOfUse= models.BooleanField()