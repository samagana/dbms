from django.urls import path, reverse_lazy
from django.contrib.auth import views as auth_views
from . import views

app_name = 'accounts'

urlpatterns = [
    path("login/", auth_views.LoginView.as_view(template_name="accounts/login.html"),name='login'),
    path("logout/", auth_views.LogoutView.as_view(), name="logout"),
    path("signup/", views.SignUp.as_view(), name="signup"),
    path("password_reset/", auth_views.PasswordResetView.as_view(template_name="accounts/password_reset_form.html",email_template_name="accounts/password_reset_email.html", subject_template_name="accounts/password_reset_subject.txt", success_url=reverse_lazy('accounts:password_reset_done')), name='password_reset'),
    path("password_reset/done", auth_views.PasswordResetDoneView.as_view(template_name="accounts/password_reset_done.html"), name='password_reset_done'),
    path("reset/<uidb64>/<token>",auth_views.PasswordResetConfirmView.as_view(template_name="accounts/password_reset_confirm.html"), name='password_reset_confirm'),
    path("reset/done/", auth_views.PasswordResetCompleteView.as_view(template_name="accounts/password_reset_complete.html"), name='password_reset_complete'),
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
