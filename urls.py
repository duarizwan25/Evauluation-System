from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('students/', views.student_list, name='student_list'),
    path('clos/', views.clo_list, name='clo_list'),
    path('assessments/', views.assessment_list, name='assessment_list'),
    path('evaluations/', views.evaluation_list, name='evaluation_list'),
]
