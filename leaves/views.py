from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import CreateView, UpdateView, View, DetailView, ListView, DeleteView
from .models import Leave
from .forms import LeaveForm
from django import forms
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy

class AddLeave(LoginRequiredMixin,CreateView):
    form_class = LeaveForm
    success_url = reverse_lazy("home")
    template_name = 'leaves/leave_form.html'

    def form_valid(self, form):
        form.instance.eid = self.request.user
        return super().form_valid(form)

class LeaveList(LoginRequiredMixin, ListView):
    model = Leave

    def get_queryset(self):
        queryset = super().get_queryset()
        if self.request.user.is_hr:
            return queryset.filter(eid__hr=self.request.user.id)
        return queryset

class MyLeaveList(LoginRequiredMixin, ListView):
    model = Leave
    template_name_suffix = '_list_my'

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(eid=self.request.user)

class ApprovedLeaves(LoginRequiredMixin, ListView):
    model = Leave
    template_name = 'leave_list.html'

    def get_queryset(self):
        queryset = super().get_queryset()
        if self.request.user.is_hr:
            return queryset.filter(eid__hr=self.request.user.id).fiter(is_approved=True)
        return queryset.filter(is_approved=True)

class UnapprovedLeaves(LoginRequiredMixin, ListView):
    model = Leave
    template_name = 'leave_list.html'

    def get_queryset(self):
        queryset = super().get_queryset()
        if self.request.user.is_hr:
            return queryset.filter(eid__hr=self.request.user.id).filter(is_approved=False)
        return queryset.filter(is_approved=False)

class ApproveLeave(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        leave = Leave.objects.get(id=self.kwargs.get('id'))
        leave.is_approved = not leave.is_approved
        leave.save()
        return HttpResponseRedirect(reverse_lazy('leaves:unapproved_leaves'))

class DeleteLeave(LoginRequiredMixin, DeleteView):
    model = Leave
    success_url = reverse_lazy('leaves:all')