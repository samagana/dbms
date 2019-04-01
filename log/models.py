from django.db import models
from accounts.models import *

# Create your models here.
class BackupUser(models.Model):
    eid = models.IntegerField(null=True, blank=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    is_hr = models.BooleanField(default=False, null=True, blank=True)
    is_admin = models.BooleanField(default=False, null=True, blank=True)
    is_approved = models.BooleanField(default=False, null=True, blank=True)
    supervisor = models.ForeignKey(User, related_name='sub_back', on_delete=models.CASCADE, null=True, blank=True)
    hr = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True, limit_choices_to={'is_hr':True})
    address = models.CharField(max_length = 255, null=True, blank=True)
    salary = models.IntegerField(null=True, blank=True)
    dept = models.ForeignKey(Department, related_name='employeesUnder_back', on_delete=models.CASCADE, null=True, blank=True)
    dob = models.DateField(null=True, blank=True)
    designation = models.ForeignKey(Designation, related_name='employeesWith_back',on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return 'Backup of ' + self.first_name + ' ' + self.last_name

class Backup(models.Model):
    from_data = models.ForeignKey(BackupUser, related_name='from_data', on_delete=models.CASCADE)
    to_data = models.ForeignKey(BackupUser, related_name='to_data', on_delete=models.CASCADE)
    time = models.DateTimeField()
    by = models.ForeignKey(User, related_name='by', on_delete=models.CASCADE)
    on_user = models.ForeignKey(User, related_name='edited', on_delete=models.CASCADE)

