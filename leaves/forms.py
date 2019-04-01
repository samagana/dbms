from django import forms
from .models import Leave
from django.db import models
from tempus_dominus.widgets import DatePicker
import datetime

class LeaveForm(forms.ModelForm):

    from_date = forms.DateField(
        widget=DatePicker(
            options={
                'minDate': str(datetime.date.today())
            }
        )
    )

    to_date = forms.DateField(
        widget=DatePicker(
            options={
                'minDate': str(datetime.date.today())
            }
        )
    )

    class Meta:
        model = Leave
        fields = ['from_date', 'to_date', 'reason']
    
    def clean_to_date(self):
        from_date = self.cleaned_data['from_date']
        to_date = self.cleaned_data['to_date']

        if from_date > to_date:
            raise forms.ValidationError('From date greater than to date')
        
        return from_date