from django.db import models
from django.contrib import auth
from django.conf import settings
from django.contrib.auth.base_user import BaseUserManager

# Create your models here.
class User(auth.models.AbstractUser):
    eid = models.IntegerField(null=True, blank=True)

    is_hr = models.BooleanField(default=False, null=True, blank=True)
    is_admin = models.BooleanField(default=False, null=True, blank=True)
    is_approved = models.BooleanField(default=False, null=True, blank=True)

    supervisor = models.ForeignKey('self', related_name='sub', on_delete=models.CASCADE, null=True, blank=True)
    hr = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
    address = models.CharField(max_length = 255, null=True, blank=True)
    salary = models.IntegerField(null=True, blank=True)
    dept = models.ForeignKey('Department', related_name='employeesUnder', on_delete=models.CASCADE, null=True, blank=True)
    dob = models.DateField(null=True, blank=True)
    designation = models.ForeignKey('Designation', related_name='employeesWith',on_delete=models.CASCADE, null=True, blank=True)
    projects = models.ManyToManyField("Project", through='WorksOn', blank=True)

    def __str__(self):
        return self.username
    

class Department(models.Model):
    deptId = models.IntegerField()
    name = models.CharField(unique = True, max_length = 255)
    manager = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='manages' ,on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name

class Designation(models.Model):
    name = models.CharField(unique = True, max_length = 255)
    maxSalary = models.IntegerField()
    minSalary = models.IntegerField()

    def __str__(self):
        return self.name

class Location(models.Model):
    deptno = models.ForeignKey('Department', related_name='loc', on_delete=models.CASCADE, null=True)
    location = models.CharField(max_length = 255)

    class Meta:
        unique_together = ('deptno', 'location')

class Project(models.Model):
    project_id = models.IntegerField()
    name = models.CharField(unique = True, max_length = 255)
    handledby = models.ForeignKey('Department', related_name='manages', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name

class WorksOn(models.Model):
    project = models.ForeignKey('Project', related_name='workson', on_delete=models.CASCADE, null=True)
    employee = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='workson', on_delete=models.CASCADE, null=True)