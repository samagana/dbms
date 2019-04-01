from django.db import models
from accounts import models as accounts
from django.conf import settings

# Create your models here.
class Leave(models.Model):
    eid = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='leave_user', on_delete=models.CASCADE)
    from_date = models.DateField()
    to_date = models.DateField()
    is_approved = models.BooleanField(default=False)
    reason = models.CharField(max_length=255)

    def __str__(self):
        return self.eid.username + ' ' + str(self.from_date) + ' - ' + str(self.to_date)