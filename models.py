# evaluation/models.py
from django.db import models

class Student(models.Model):
    name = models.CharField(max_length=100)
    roll_number = models.CharField(max_length=20, unique=True)
    session = models.CharField(max_length=10)
    semester = models.IntegerField()

    def __str__(self):
        return f"{self.name} ({self.roll_number})"

class CLO(models.Model):
    description = models.TextField()
    taxonomy_level = models.CharField(max_length=50)
    plo = models.CharField(max_length=50)

    def __str__(self):
        return self.description

class Rubric(models.Model):
    clo = models.ForeignKey(CLO, on_delete=models.CASCADE)
    description = models.TextField()

    def __str__(self):
        return self.description

class RubricLevel(models.Model):
    rubric = models.ForeignKey(Rubric, on_delete=models.CASCADE)
    level_number = models.IntegerField()
    criteria = models.TextField()
    marks = models.PositiveIntegerField()

    def __str__(self):
        return f"Level {self.level_number} ({self.marks} marks)"

class Assessment(models.Model):
    title = models.CharField(max_length=100)
    total_marks = models.PositiveIntegerField()
    weightage = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.title

class Evaluation(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    assessment = models.ForeignKey(Assessment, on_delete=models.CASCADE)
    rubric_level = models.ForeignKey(RubricLevel, on_delete=models.CASCADE)
    obtained_marks = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.student} - {self.assessment} - {self.obtained_marks} marks"
