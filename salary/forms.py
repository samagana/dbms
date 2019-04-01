from django.forms import ModelForm
from .models import *

class SalaryForm(ModelForm):
    class Meta:
        model = Salary
        fields = ['emp', 'amount']