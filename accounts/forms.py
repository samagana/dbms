from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm, Form
from django.forms import TextInput


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


    
