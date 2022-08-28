from django.db import models

# Create your models here.
class profile (models.Model):
    username = models.TextField(max_length=200)
    Place_of_residence = models.TextField(max_length=200)
    Gender = (('male', 'male'),
    ('female', 'female'))
    gender = models.CharField(
       max_length=32,
       choices= Gender,
       default='male',
   )
    age = models.IntegerField()
    


    
   