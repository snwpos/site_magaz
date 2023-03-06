from django.contrib import admin
from .models import CustomUser, Cinema, CityLocation, Role



admin.site.register(CustomUser)
admin.site.register(Cinema)
admin.site.register(CityLocation)
admin.site.register(Role)
