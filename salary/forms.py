from django.forms import ModelForm, Form
from django import forms
from .models import *

class SalaryForm(ModelForm):
    class Meta:
        model = Salary
        fields = ['emp', 'amount']

class ReportForm(Form):
    from_date = forms.DateField()
    to_date = forms.DateField()
    