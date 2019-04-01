from django.contrib import admin
from django.conf import settings
from accounts import models

# Register your models here.
admin.site.register(models.Department)
admin.site.register(models.Designation)
admin.site.register(models.Project)
admin.site.register(models.WorksOn)
admin.site.register(models.Location)
admin.site.register(models.User)
admin.site.register(models.Dependent)
