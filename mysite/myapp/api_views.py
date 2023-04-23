from django.http import HttpResponse
from rest_framework.generics import ListAPIView, GenericAPIView

from .forms import UserRegistrationForm
from .serializers import  ClothSerializer, PublisherSerializer, TypeSerializer, UserSerializer
from rest_framework.generics import ListAPIView

from rest_framework import generics
from django.contrib.auth import authenticate
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.status import HTTP_401_UNAUTHORIZED
from rest_framework.permissions import IsAdminUser
from rest_framework import status

from myapp import models
from rest_framework.permissions import IsAuthenticated
import json
# class ServicesListView(ListAPIView):
#     model = 


# class LoginAPI(generics.GenericAPIView):
#     serializer_class = CustomUserSerializer

#     def post(self, request, *args, **kwargs):
#         username = request.data.get('username')
#         password = request.data.get('password')
#         user = authenticate(username=username, password=password)
#         if user is None:
#             return Response({'error': 'Invalid credentials'})
#         return Response({
#             "user": CustomUserSerializer(user, context=self.get_serializer_context()).data,
#             "token": Token.objects.create(user=user).key
#         })
class ClothesList(ListAPIView):
    serializer_class = ClothSerializer
    queryset = models.Cloth.objects.all()
    print(queryset)

class TypeList(ListAPIView):
    serializer_class = TypeSerializer
    queryset = models.Type.objects.all()
    print(queryset)

class PublisherView(ListAPIView):
    serializer_class = PublisherSerializer
    queryset = models.CustomUser.objects.all()
    # permission_classes = [IsAuthenticated]

class RegistrationView(generics.CreateAPIView):

    # model = models.CustomUser
    serializer_class = UserSerializer
    queryset = models.CustomUser.objects.all()

    # def post(self, request):
    #     form_data = request.data
    #     print(form_data)

    #     form =UserRegistrationForm(form_data)

    #     if form.is_valid():
    #         form.save()
    #         return HttpResponse(json.dumps(['YES']))
        
    #     else:
    #         response = []
    #         errors = form.errors

    #         for field in errors:
    #             error_msgs = errors[field]
    #             for error_msg in error_msgs:
    #                  response.append(error_msg)
    #         return HttpResponse(json.dumps(response))