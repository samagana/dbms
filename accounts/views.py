from django.contrib.auth import login, logout, get_user_model
from django.urls import reverse_lazy, reverse
from django.shortcuts import get_object_or_404, HttpResponseRedirect
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import CreateView, ListView, DetailView, UpdateView, View, DeleteView
from . import models
from log.models import BackupUser, Backup
from . import forms
import datetime

cur_user_model = get_user_model()

class SignUp(CreateView):
    form_class = forms.UserCreateForm
    success_url = reverse_lazy("login")
    template_name = "accounts/signup.html"

class UserList(LoginRequiredMixin, ListView):
    model = models.User

    def get_queryset(self):
        queryset = super().get_queryset()
        if self.request.user.is_admin:
            return queryset
        return queryset.filter(hr=self.request.user.id)


class UserDetail(LoginRequiredMixin, DetailView):
    model = models.User

    def get(self, request, *args, **kwargs):
        if not(models.User.objects.get(pk=self.kwargs['pk']).hr == self.request.user or self.request.user.is_admin):
            return HttpResponseRedirect(reverse('accounts:user_list'))
        return super(UserDetail, self).get(request,*args, **kwargs)

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
    fields = ["first_name", "last_name", "address", "email", "is_approved", "is_hr", "is_admin",
    "hr", "supervisor", "dept", "salary", "designation"]
    success_url = reverse_lazy('accounts:user_list')

    def get(self, request, *args, **kwargs):
        if not(models.User.objects.get(pk=self.kwargs['pk']).hr == self.request.user or self.request.user.is_admin):
            return HttpResponseRedirect(reverse('accounts:user_list'))
        return super(UserUpdateView, self).get(request,*args, **kwargs)
    
    def form_valid(self, form):
        before = BackupUser()
        after = BackupUser()
        entry = Backup()
        for field in BackupUser._meta.fields:
            if field.primary_key:
                continue
            setattr(before, field.name, getattr(self.get_object(), field.name))
        before.save()
        temp = form.save(commit=False)
        for field in BackupUser._meta.fields:
            if field.primary_key:
                continue
            setattr(after, field.name, getattr(temp, field.name))
        after.save()
        entry.from_data = before
        entry.to_data = after
        entry.by = self.request.user
        entry.time = datetime.datetime.now()
        entry.on_user = self.object
        entry.save()
        return super().form_valid(form)

class CurUserUpdateView(LoginRequiredMixin, UpdateView):
    model = models.User
    template_name_suffix = "_update_form"
    fields = ["first_name", "last_name", "address", "email"]
    success_url = reverse_lazy('accounts:cur_user')

    def get_queryset(self):
        self.kwargs['pk'] = self.request.user.pk
        return models.User.objects.filter(id__iexact=self.request.user.id)
    
class DeleteUser(LoginRequiredMixin, DeleteView):
    model = models.User
    success_url = reverse_lazy('accounts:user_list')

class CreateDepartment(LoginRequiredMixin, CreateView):
    success_url = reverse_lazy('accounts:list_department')
    form_class = forms.DepartmentForm
    template_name = 'accounts/create_department.html'

class CreateDesignation(LoginRequiredMixin, CreateView):
    success_url = reverse_lazy('accounts:list_designation')
    form_class = forms.DesignationForm
    template_name = 'accounts/create_department.html'

class CreateProject(LoginRequiredMixin, CreateView):
    success_url = reverse_lazy('accounts:list_project')
    form_class = forms.ProjectForm
    template_name = 'accounts/create_department.html'

class CreateWorksOn(LoginRequiredMixin, CreateView):
    success_url = reverse_lazy('accounts:list_project')
    form_class = forms.WorksOnForm
    template_name = 'accounts/create_department.html'

class CreateDependent(LoginRequiredMixin, CreateView):
    success_url = reverse_lazy('accounts:list_dependent')
    form_class = forms.DependentForm
    template_name = 'accounts/create_department.html'

    def form_valid(self, form):
        form.instance.emp = self.request.user
        return super().form_valid(form)

class DepartmentList(LoginRequiredMixin, ListView):
    model = models.Department

class DesignationList(LoginRequiredMixin, ListView):
    model = models.Designation

class ProjectList(LoginRequiredMixin, ListView):
    model = models.Project

class DependentList(LoginRequiredMixin, ListView):
    model = models.Dependent

    def get_queryset(self):
        queryset = models.Dependent.objects.filter(emp=self.request.user)
        return queryset

class DepartmentDetail(LoginRequiredMixin, DetailView):
    model = models.Department

class DesignationDetail(LoginRequiredMixin, DetailView):
    model = models.Designation
    
class ProjectDetail(LoginRequiredMixin, DetailView):
    model = models.Project

    



