from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

app_name = 'accounts'

urlpatterns = [
    path("login/", auth_views.LoginView.as_view(template_name="accounts/login.html"),name='login'),
    path("logout/", auth_views.LogoutView.as_view(), name="logout"),
    path("signup/", views.SignUp.as_view(), name="signup"),
    path('all/', views.UserList2, name = 'user_list'),
    path('<pk>/', views.UserDetail.as_view(), name = 'detail_user'),
    path('my', views.CurUserDetail.as_view(), name = 'cur_user'),
    path('my/edit', views.CurUserUpdateView.as_view(),  name='edit_my'),
    path('edit/<pk>/', views.UserUpdateView.as_view(), name='edit_profile'),
    path('delete/<pk>/', views.DeleteUser.as_view(), name='delete_profile'),
    path('dept/add', views.CreateDepartment.as_view(), name='create_department'),
    path('dept/all', views.DepartmentList.as_view(), name='list_department'),
    path('dept/<pk>', views.DepartmentDetail.as_view(), name='detail_department'),
    path('proj/link', views.CreateWorksOn.as_view(), name='project_link'),
    path('proj/add', views.CreateProject.as_view(), name='create_project'),
    path('proj/all', views.ProjectList.as_view(), name='list_project'),
    path('proj/<pk>', views.ProjectDetail.as_view(), name='detail_project'),
    path('designation/add', views.CreateDesignation.as_view(), name='create_designation'),
    path('designation/all', views.DesignationList.as_view(), name='list_designation'),
    path('designation/<pk>', views.DesignationDetail.as_view(), name='detail_designation'),
    path('dependent/add', views.CreateDependent.as_view(), name='create_dependent'),
    path('dependent/list', views.DependentList.as_view(), name='list_dependent'),
]
