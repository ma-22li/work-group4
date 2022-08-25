from django.db import models

# Create your models here.
class Post(models.Model):
    name = models.CharField(max_length=50)
    musqname = models.CharField(max_length=50)
    type = models.CharField(max_length=50)
    time = models.DateTimeField()
    catg = models.BooleanField()