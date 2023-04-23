
from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Cloth, CustomUser, Type
from rest_framework.authtoken.models import Token
from rest_framework.validators import UniqueTogetherValidator


class PublisherSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'



class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Type
        fields = '__all__'

class ClothSerializer(serializers.ModelSerializer):
    type = TypeSerializer()
    class Meta:
        model = Cloth
        fields = '__all__'
        
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'