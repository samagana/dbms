from django.contrib.auth import login, logout, get_user_model
from django.urls import reverse_lazy
from django.shortcuts import get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import CreateView, ListView, DetailView, UpdateView, View
from . import models
from . import forms

class SignUp(CreateView):
    form_class = forms.UserCreateForm
    success_url = reverse_lazy("login")
    template_name = "accounts/signup.html"

class UserList(LoginRequiredMixin, ListView):
    model = models.User

class UserDetail(LoginRequiredMixin, DetailView):
    model = models.User

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(
            id__iexact=self.kwargs.get("pk")
        )

class CurUserDetail(LoginRequiredMixin, DetailView):
    model = models.User

    def get_queryset(self):
        queryset = super().get_queryset()
        self.kwargs['pk'] = self.request.user.pk
        return queryset.filter(
            id__iexact=self.request.user.id
        )

class UserUpdateView(LoginRequiredMixin, UpdateView):
    model = models.User
    template_name_suffix = "_update_form"
    fields = ["first_name", "last_name", "address", "email", "is_approved",]

class CurUserUpdateView(LoginRequiredMixin, UpdateView):
    model = models.User
    template_name_suffix = "_update_form"
    fields = ["first_name", "last_name", "address", "email"]
    success_url = reverse_lazy('accounts:cur_user')

    def get_queryset(self):
        self.kwargs['pk'] = self.request.user.pk
        return models.User.objects.filter(id__iexact=self.request.user.id)


