from django.urls import path
from .views import *

app_name = 'salary'

urlpatterns = [
    path('add', CreateSalary.as_view(), name='add_salary'),
    path('list', SalaryList.as_view(), name='list_salary'),
    path('my', MySalaryList.as_view(), name='my_salary'),
    path('<pk>', SalaryDetail.as_view(), name='detail_salary'),
]