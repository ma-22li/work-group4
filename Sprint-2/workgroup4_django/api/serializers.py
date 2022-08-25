from wsgiref.validate import validator
from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework.response import Response
from rest_framework import status
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from api.models import Post

  
#Serializer to Get User Details using Django Token Authentication
class UserSerializer(serializers.ModelSerializer):
  class Meta:
    model = User
    fields = ["id", "username"]

#Serializer to Register User
class CreateCircuitSerializer(serializers.ModelSerializer):
  musqname = serializers.CharField(
    required=True,
  )
  type = serializers.CharField(
    required=True,
  )
  catg = serializers.CharField(
    required=True,
  )
  time = serializers.DateField(
    required=True,
  )
  name = serializers.CharField(
    required=True,
  )
  class Meta:
    model = Post
    fields = ["name", "musqname" , "type" , "time" , "catg"]

  def create(self, validated_data):
    circuit = Post.objects.create(
      name=validated_data['name'],
      musqname=validated_data['musqname'],
      type=validated_data['type'],
      time=validated_data['time'],
      catg=validated_data['catg'],
    )
    circuit.save()
    return circuit

#Serializer to Create Ciruit
class RegisterSerializer(serializers.ModelSerializer):
  email = serializers.EmailField(
    required=True,
    validators=[UniqueValidator(queryset=User.objects.all())]
  )
  password = serializers.CharField(
    write_only=True, required=True, validators=[validate_password])
  class Meta:
    model = User
    fields = ('username','password','email',)

  def create(self, validated_data):
    user = User.objects.create(
      username=validated_data['username'],
      email=validated_data['email'],
    )
    user.set_password(validated_data['password'])
    user.save()
    return user

 