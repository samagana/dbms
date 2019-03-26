from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

app_name = 'accounts'

urlpatterns = [
    path("login/", auth_views.LoginView.as_view(template_name="accounts/login.html"),name='login'),
    path("logout/", auth_views.LogoutView.as_view(), name="logout"),
    path("signup/", views.SignUp.as_view(), name="signup"),
    path('profile/all/', views.UserList.as_view(), name = 'user_list'),
    path('profile/<pk>/', views.UserDetail.as_view(), name = 'detail_user'),
    path('my', views.CurUserDetail.as_view(), name = 'cur_user'),
    path('my/edit', views.CurUserUpdateView.as_view(),  name='edit_my'),
    path('edit/<pk>/', views.UserUpdateView.as_view(), name='edit_profile'),
]
