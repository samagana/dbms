from django.shortcuts import render, HttpResponseRedirect, get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView, View
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Backup, BackupUser
from accounts.models import User
from .forms import BackupUserForm

# Create your views here.
class LogList(LoginRequiredMixin, ListView):
    model = Backup
    template_name = 'log/log_list.html'
    ordering = ['-time']

class LogDetail(LoginRequiredMixin, DetailView):
    model = Backup
    template_name = 'log/log_detail.html'

    def get(self, request, *args, **kwargs):
        model1 = get_object_or_404(BackupUser, pk=self.get_object().from_data.pk)
        model2 = get_object_or_404(BackupUser, pk=self.get_object().to_data.pk)
        form1 = BackupUserForm(instance=model1)
        form2 = BackupUserForm(instance=model2)
        return render(request, 'log/log_detail.html', {'form1': form1, 'form2':form2, 'object':self.get_object()})

class RecoverLog(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        back = Backup.objects.get(id=self.kwargs['pk']).from_data
        obj = Backup.objects.get(id=self.kwargs['pk']).on_user
        for field in BackupUser._meta.fields:
            if field.primary_key:
                continue
            setattr(obj, field.name, getattr(back, field.name))
        obj.save()
        return HttpResponseRedirect(reverse_lazy('accounts:detail_user', kwargs={'pk':obj.pk}))