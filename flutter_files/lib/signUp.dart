import 'package:flutter/material.dart';
import 'package:workgroup4_flutter/signUpPost.dart';
import 'dart:async';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool chek = false;
  String validText = '  ';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passConroller = TextEditingController();
  TextEditingController _emailConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign Up',
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
                  //name = value;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: false,
                onChanged: (value) {
                  //name = value;
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
                  //name = value;
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
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Agree to terms and conditions'),
                // activeColor: Colors.red,
                value: chek,
                onChanged: (val) {
                  setState(() {
                    chek = val;
                  });
                },
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
                            "    You should agree on terms and conditions";
                      });
                    } else if (validCheck(_nameController.text,
                                _emailConroller.text, _passConroller.text)
                            .ValidInput() ==
                        "success") {
                      setState(() {
                        SignUpPost().signUpPost(
                          _nameController.text,
                          _emailConroller.text,
                          _passConroller.text,
                        );
                      });
                    } else {
                      setState(() {
                        validText = "    " +
                            validCheck(_nameController.text,
                                    _emailConroller.text, _passConroller.text)
                                .ValidInput();
                      });
                    }
                  },
                  child: Text(
                    'Sign Up',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'or Sign Up by',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 135,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Google',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 135,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Twitter',
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class validCheck {
  String UserName;
  String Password;
  String Email;

  validCheck(this.UserName, this.Email, this.Password);

  bool isNumeric(String str) {
    bool found = str.contains(new RegExp(r'[0-9]'));
    return found;
  }

  String ValidInput() {
    if (UserName.isEmpty) {
      return "User Name is empty you should fill it";
    }
    if (Password.isEmpty) {
      return "Password is empty you should fill it";
    }
    if (Email.isEmpty) {
      return "Email is empty you should fill it";
    }
    if (isNumeric(UserName)) {
      return "User Name must not contain any number!";
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(Email);
    if (!emailValid) {
      return "Email form is not correct!";
    }
    return "success";
  }
}
