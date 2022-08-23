from unicodedata import category
from django.db import models

# Create your models here.
class Round(models.Model):
    title = models.TextField(max_length=400)
    mosque = models.TextField(max_length=200)
    type = models.TextField(max_length=200)
    date = models.DateTimeField()
    category=models.TextField(max_length=200)
