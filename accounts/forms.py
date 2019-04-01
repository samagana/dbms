from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm, Form
from django.forms import TextInput
from .models import *


class UserCreateForm(UserCreationForm):

    class Meta:
        fields = ["first_name", "last_name", "username", "email", "password1", "password2"]
        model = get_user_model()
        widgets = {
            'first_name':TextInput(attrs={'autofocus':''}),
        }

class UserUpdationForm(ModelForm):

    class Meta:
        model = get_user_model()
        fields = ["first_name", "last_name", "address", "email"]
    
class DepartmentForm(ModelForm):
    class Meta:
        model = Department
        fields = "__all__"

class DesignationForm(ModelForm):
    class Meta:
        model = Designation
        fields = "__all__"

class ProjectForm(ModelForm):
    class Meta:
        model = Project
        fields = "__all__"

class WorksOnForm(ModelForm):
    class Meta:
        model = WorksOn
        fields = "__all__"

class DependentForm(ModelForm):
    class Meta:
        model = Dependent
        fields = ['name', 'relation', 'mobileno']

    
