from django.contrib import admin
from myapp import models


admin.site.register(models.CustomUser)
admin.site.register(models.Cloth)
admin.site.register(models.Sise)
admin.site.register(models.Type)
admin.site.register(models.Brand)
admin.site.register(models.Color)
admin.site.register(models.Role)
# admin.site.register(models.Basket)