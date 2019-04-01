from django.urls import path
from .views import *

app_name = 'log'

urlpatterns = [
    path('list/', LogList.as_view(), name='list_log'),
    path('<pk>/', LogDetail.as_view(), name='detail_log'),
    path('recover/<pk>/', RecoverLog.as_view(), name='recover_log'),
]