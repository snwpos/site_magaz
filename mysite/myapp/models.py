
from django.db import models
from django.contrib.auth.models import User, Group, AbstractUser
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
        user.save()
        return user

    def is_saler(self):
        return self.model.role

    def create_superuser(self, username, email, password):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """

        print("DDDDDD:", username, password, email)

        user = self.create_user(
            username,
            password,
            email
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class Role(models.Model):
    name = models.CharField("Роль пользователя", max_length=255)

    def __str__(self):
        return self.name


class CustomUser(AbstractUser):
    phone_number = models.CharField(("Номер телефона"), max_length=50)
    objects = CustomUserManager()

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    role = models.ForeignKey(Role, on_delete=models.CASCADE, null=True, verbose_name="Роль пользователя")

    def is_saler(self):
        return self.role

    class Meta:
        verbose_name = "Пользователь"
        verbose_name_plural = 'Пользователи'

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin




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








