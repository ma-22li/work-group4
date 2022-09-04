import 'package:flutter/material.dart';

import '../login.dart';
import 'Next.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool chek = false;
  String validText = '  ';
  TextEditingController _passConroller = TextEditingController();
  TextEditingController _emailConroller = TextEditingController();
  MaterialColor feedback = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'login ',
          ),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: false,
                onChanged: (value) {
                  
                },
                controller: _emailConroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  
                },
                controller: _passConroller,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                validText,
                style: TextStyle(
                  fontSize: 15,
                  color: feedback,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (!chek) {
                      setState(() {
                        validText =
                        " Error";
                        feedback = Colors.red;
                      });
                    } else if (validCheck(_nameController.text,
                        _emailConroller.text, _passConroller.text)
                        .ValidInput() ==
                        "success") {
                      LoginPost postObject = new LoginPost(

                      );
                      postObject.loginPost( _nameController.text,
                        _emailConroller.text,
                        _passConroller.text,).then((result) {
                        if (validCheck(_nameController.text,
                            _emailConroller.text, _passConroller.text)
                            .failSuccess('result')) {
                          setState(() {
                            validText = "    " + "Success!";
                            feedback = Colors.green;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  NextScreen()),
                            );
                          });
                        } else {
                          setState(() {
                            validText = "    " + "Error: ";
                            feedback = Colors.red;
                          });
                        }
                      });
                    } else {
                      setState(() {
                        validText = "    " +
                            validCheck(_nameController.text,
                                _emailConroller.text, _passConroller.text)
                                .ValidInput();
                        feedback = Colors.red;
                      });
                    }
                  },
                  child: Text(
                    ' login',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}

class validCheck {
  
  String Password;
  String Email;

  validCheck( this.Email, this.Password);

  String ValidInput() {
    if (Password.isEmpty) {
      return "Password is empty you should fill it";
    }
    if (Email.isEmpty) {
      return "Email is empty you should fill it";
    }
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(Email);
    if (!emailValid) {
      return "Email form is not correct!";
    }
    return "success";
  }

  bool failSuccess(String messege) {
    if (messege == "{\"email\":\"$Email\"}") {
      return true;
    } else {
      return false;
    }
  }
}
