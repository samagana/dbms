from django.contrib import admin
from .models import BackupUser, Backup

# Register your models here.
admin.site.register(Backup)
admin.site.register(BackupUser)