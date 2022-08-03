import 'package:flutter/material.dart';

void main(){
  //TODO link the userName and Password and email got from user input to the below variables 
  //String UserName;
  //String Password;
  //String Email;
    
  validCheck str = new validCheck(UserName,Password,Email);
  print(str.ValidInput());
}



class validCheck {
  
  
  String UserName;
  String Password;
  String Email;

  validCheck(this.UserName,this.Email,this.Password);

  bool isNumeric(String str) {
    bool found = str.contains(new RegExp(r'[0-9]'));
    return found;
} 
  
  
  String ValidInput(){
  
  if(UserName.isEmpty){ 
    return "User Name is empty you should fill it";
  }
  if(Password.isEmpty){ 
    return "Password is empty you should fill it";
  }
  if(Email.isEmpty){ 
    return "Email is empty you should fill it";
  }
  if(isNumeric(UserName)){ 
    return "User Name must not contain any number!";
  }
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email);
  if(!emailValid){
    return "Email form is not correct!";
  }
  return "success";
  }
}
