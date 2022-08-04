import 'package:flutter/material.dart';
import 'package:http/http.dart';

class signUpScreen extends StatefulWidget{
  const signUpScreen({ Key? key }) : super(key: key);
  
  @override
  State<signUpScreen> createState() => _signUpScreenState();
}


class _signUpScreen extends State<signUpScreen> {
  
  String UserName;
  String Password;
  String Email;
  
  validCheck checkInput = new validCheck(UserName,Email,Password);
  String URL;
  
  void signUp(){
    
    try{
      Response respone = await post(
        Uri.parse(URL),
        body:{
          ''
        };
        
        if(respone.statusCode == 200){
          var data = jsonDecode(response.body.toString());
          print('success');
        } else {
          print('faield');
         } 
    }catch(e){
      print(e.toString());
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306));
  }
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
