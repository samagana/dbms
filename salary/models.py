from django.db import models
from accounts.models import *

# Create your models here.
class Salary(models.Model):
    emp = models.ForeignKey(User, related_name='sal', on_delete=models.CASCADE)
    amount = models.IntegerField()
    date = models.DateTimeField()
    
