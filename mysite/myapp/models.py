
from django.db import models
from django.contrib.auth.models import User, Group
from django.contrib.auth.base_user import BaseUserManager



class CustomUserManager(BaseUserManager):
    """
    Custom user model manager where email is the unique identifiers
    for authentication instead of usernames.
    """
    def create_user(self, username, password, email, **extra_fields):
        """
        Create and save a user with the given email and password.
        """
        if not email:
            raise ValueError(("The Email must be set"))
        email = self.normalize_email(email)
        user = self.model(username=username, email=email, **extra_fields)
        user.set_password(password)
        group = Group.objects.get(name='customer')
        user.save()
        user.groups.add(group)
        return user

class CustomUser(User):

    phone_number = models.CharField(("Номер телефона"), max_length=50)
    objects = CustomUserManager()

    class Meta:
        verbose_name = "Пользователь"
        verbose_name_plural = 'Пользователи'






class CityLocation(models.Model):

    name = models.CharField(("Товары"), max_length=128, unique=True)

    class Meta:
        verbose_name = "Каталог"
        verbose_name_plural = 'Каталог'

    def __str__(self) -> str:
        return self.name
    
class Cinema(models.Model):

    """Добавить описание кинотеатра и еще немного характеристик"""
    cinema = models.CharField(max_length=128)
    address = models.TextField()
    city = models.ForeignKey(to=CityLocation, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='media', null=True, blank=True)

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"

    def __str__(self) -> str:
        return self.cinema








