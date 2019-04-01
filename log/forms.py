from django.forms import ModelForm
from .models import Backup, BackupUser

class BackupUserForm(ModelForm):
    class Meta:
        model = BackupUser
        fields = '__all__'
