from django.contrib import admin
from .models import Student, CLO, Rubric, RubricLevel, Assessment, Evaluation

admin.site.register(Student)
admin.site.register(CLO)
admin.site.register(Rubric)
admin.site.register(RubricLevel)
admin.site.register(Assessment)
admin.site.register(Evaluation)
