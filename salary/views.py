from django.shortcuts import render
from django.urls import reverse_lazy
from accounts.models import *
from .models import *
from .forms import *
from django.views.generic import CreateView, ListView, DetailView
from django.views.generic.edit import FormView
from django.contrib.auth.mixins import LoginRequiredMixin
import datetime

class CreateSalary(LoginRequiredMixin, CreateView):
    form_class = SalaryForm
    success_url = reverse_lazy('salary:list_salary')
    template_name = 'salary/create_salary.html'

    def form_valid(self, form):
        form.instance.date = datetime.date.today()
        return super().form_valid(form)

    def get_form(self, *args, **kwargs):
        form = super(CreateSalary, self).get_form(*args, **kwargs)
        if self.request.user.is_hr:
            form.fields['emp'].queryset = User.objects.filter(hr=self.request.user)
        return form

class SalaryList(LoginRequiredMixin, ListView):
    model = Salary
    ordering = ['-date']

class MySalaryList(LoginRequiredMixin, ListView):
    model = Salary
    ordering = ['-date']
    template_name_suffix = '_list_my'

    def get_queryset(self):
        queryset = Salary.objects.filter(emp=self.request.user)
        return queryset

class SalaryDetail(LoginRequiredMixin, DetailView):
    model = Salary

    def get_context_data(self, **kwargs):
        data = super().get_context_data(**kwargs)
        obj = self.get_object()
        data['basic'] = obj.amount*0.6
        data['pf'] = obj.amount*0.04
        data['hra'] = obj.amount*0.3
        data['esi'] = obj.amount*0.015
        data['con'] = obj.amount*0.01
        data['tot'] = obj.amount
        data['ded'] = obj.amount * 0.055
        data['net'] = obj.amount * 0.945
        return data

class SalaryReport(LoginRequiredMixin, FormView):
    form_class = ReportForm
    template_name = "report.html"

    def form_valid(self, form):
        dfrom = form.instance.from_date
        dto = form.instance.to_date
        queryset = Salary.objects.filter(date__gte=dfrom).filter(date__lte=dto)
        