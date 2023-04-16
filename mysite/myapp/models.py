
from django.db import models
from django.contrib.auth.models import User, Group, AbstractUser
from django.contrib.auth.base_user import BaseUserManager
from rest_framework import serializers


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




class Type(models.Model):

    name = models.CharField(("Каталог"), max_length=128, unique=True)

    class Meta:
        verbose_name = "Вид"
        verbose_name_plural = 'Виды'

    def __str__(self) -> str:
        return self.name
    
class Brand(models.Model):
    name = models.CharField('Название бренда', max_length=128, unique=True)

    class Meta:
        verbose_name = "Бренд"
        verbose_name_plural = 'Бренды'

    def __str__(self) -> str:
        return self.name

class Color(models.Model):
    name = models.CharField('Цвет', max_length=128, unique=True)

    class Meta:
        verbose_name = "Цвет"
        verbose_name_plural = 'Цвета'

    def __str__(self) -> str:
        return self.name

class Sise(models.Model):
    name = models.CharField('Размер', max_length=128, unique=True)

    class Meta:
        verbose_name = "Размер"
        verbose_name_plural = 'Размеры'

    def __str__(self) -> str:
        return self.name

class Cloth(models.Model):

    """Добавить товар и описание товара"""
    name = models.CharField("Название товара", max_length=128)
    brand = models.ForeignKey(to=Brand, verbose_name="Бренд", on_delete=models.CASCADE)
    type = models.ForeignKey(Type, verbose_name="Вид", on_delete=models.CASCADE)
    color = models.ForeignKey(Color, verbose_name="Цвет", on_delete=models.CASCADE)
    price = models.FloatField('Цена')
    isbn = models.CharField("Исбн товара", max_length=255)
    image = models.ImageField("Изображение", upload_to='media', null=True, blank=True)
    url = models.SlugField(max_length=160, unique=True)

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"

    def __str__(self) -> str:
        return self.name

class Basket(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    cloth = models.ForeignKey(Cloth, on_delete=models.CASCADE)
    price = models.FloatField('Цена')
    quantity_buying = models.IntegerField('Общая цена')

    class Meta:
        verbose_name = "Корзина"
        verbose_name_plural = "Корзины"

    def __str__(self) -> str:
        return self.name
    
    def sum(self):
        print("FFFFFFFFF:   ", self.price, self.quantity_buying)
        return self.price * self.quantity_buying

class Card(models.Model):
    name = models.CharField("Банковская карта", max_length=255, unique=True )

    class Meta:
        verbose_name = "Карта"
        verbose_name_plural = "Карты"

    def __str__(self) -> str:
        return self.name

class Pay(models.Model):
    name = models.CharField("Способ оплаты", max_length=255, unique=True )

    class Meta:
        verbose_name = "Способ оплаты"
        verbose_name_plural = "Способы оплаты"

    def __str__(self) -> str:
        return self.name
    
class Buy(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    purchased_books = models.ManyToManyField(to=Cloth)
    date = models.SmallIntegerField("Дата покупки")
    total_price = models.FloatField()
    quantity_buying = models.ForeignKey(Basket, on_delete=models.CASCADE)
    card = models.ForeignKey(Card, on_delete=models.CASCADE)
    pay = models.ForeignKey(Pay, on_delete=models.CASCADE)










