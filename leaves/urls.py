from django.urls import path
from . import views

app_name = 'leaves'

urlpatterns = [
    path('add', views.AddLeave.as_view(), name='add_leave'),
    path('all', views.LeaveList.as_view(), name='all_leaves'),
    path('my', views.MyLeaveList.as_view(), name='my_leaves'),
    path('unapproved', views.UnapprovedLeaves.as_view(), name='unapproved_leaves'),
    path('approved', views.ApprovedLeaves.as_view(), name='approved_leaves'),
    path('delete/<pk>', views.DeleteLeave.as_view(), name='delete_leave'),
    path('approve/<id>', views.ApproveLeave.as_view(), name='approve'),
]