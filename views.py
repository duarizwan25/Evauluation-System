from django.shortcuts import render
from .models import Student, CLO, Assessment, Evaluation

def home(request):
    return render(request, 'evaluation/base.html')

def student_list(request):
    students = Student.objects.all()
    return render(request, 'evaluation/students.html', {'students': students})

def clo_list(request):
    clos = CLO.objects.all()
    return render(request, 'evaluation/clos.html', {'clos': clos})

def assessment_list(request):
    assessments = Assessment.objects.all()
    return render(request, 'evaluation/assessments.html', {'assessments': assessments})

def evaluation_list(request):
    evaluations = Evaluation.objects.select_related('student', 'assessment', 'rubric_level')
    return render(request, 'evaluation/evaluations.html', {'evaluations': evaluations})
