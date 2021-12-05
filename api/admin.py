from django.contrib import admin
from .models import Event, Jury, Asessor, Nomination, Criterion, FooUserProfile, Scores

admin.site.register(Event)
admin.site.register(Jury)
admin.site.register(Asessor)
admin.site.register(Nomination)
admin.site.register(Criterion)
admin.site.register(FooUserProfile)
admin.site.register(Scores)