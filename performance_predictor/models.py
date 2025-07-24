from django.db import models

# Create your models here.
from django.contrib.auth.models import User

class Prediction(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    study_hours = models.FloatField()
    previous_scores = models.FloatField()
    predicted = models.IntegerField()


#     def __str__(self):
#         return self.user.username
# class Performance(models.Model):
#     student = models.ForeignKey(StudentProfile, on_delete=models.CASCADE)
#     subject = models.CharField(max_length=100)
#     score = models.FloatField()
#     date = models.DateField()

#     def __str__(self):
#         return f"{self.student.user.username} - {self.subject} - {self.score}"