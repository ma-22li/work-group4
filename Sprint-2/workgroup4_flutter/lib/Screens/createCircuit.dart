import 'package:flutter/material.dart';
import 'package:workgroup4_flutter/CreateCircPost.dart';
import 'package:workgroup4_flutter/Screens/Next.dart';
import 'dart:async';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NewCourse extends StatefulWidget {
  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  var name = "Defualt";
  var musq = "Defualt";
  var type = "Defualt";
  var date = "2022-01-09";
  var catg = "True";

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var chek;
    var drobDownValue = "Choose Type";
    var drobDownValue2 = "Choose Categeory";

    var items = <String>['Choose Type', 'Two', 'Free', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
    var items2 = <String>['Choose Categeory', 'Two', 'Free', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('New Course'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 350,
                child: TextField(
                  obscureText: false,
                  onChanged: (value) {
                    //name = value;
                  },
                  //controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name of Class',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Name of the Class',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 350,
                child: TextField(
                  obscureText: false,
                  onChanged: (value) {
                    //name = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'mousqe of Class',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the mousqe of the Class',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  width: 350,
                  child: DropdownButton<String>(
                    value: drobDownValue,
                    items: items,
                    onChanged: (String? newValue) {
                      setState(() {
                        drobDownValue = newValue!;
                      });
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  width: 350,
                  child: DropdownButton<String>(
                    value: drobDownValue2,
                    items: items2,
                    onChanged: (String? newValue) {
                      setState(() {
                        drobDownValue2 = newValue!;
                      });
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select date'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     CheckboxListTile(
              //       controlAffinity: ListTileControlAffinity.leading,
              //       title: Text('الكبار'),
              //       // activeColor: Colors.red,
              //       value: chek,
              //       onChanged: (val) {
              //         setState(() {
              //           chek = val!;
              //         });
              //       },
              //     ),
              //     SizedBox(
              //       width: 30,
              //     ),
              //     CheckboxListTile(
              //       controlAffinity: ListTileControlAffinity.leading,
              //       title: Text('الصغار'),
              //       // activeColor: Colors.red,
              //       value: chek,
              //       onChanged: (val) {
              //         setState(() {
              //           chek = val!;
              //         });
              //       },
              //     ),
              //   ],
              // )

              Container(
                height: 36,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    CreateCircPost ciruit =
                        new CreateCircPost(name, musq, type, catg, date);
                    ciruit.createPost().then((result) {
                      setState(() {
                        print(result);
                      });
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NextScreen()),
                    );
                  },
                  child: Text('Creat Class'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class validCheck {
  String UserName;
  String Password;
  String Email;

  validCheck(this.UserName, this.Email, this.Password);

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
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(Email);
    if (!emailValid) {
      return "Email form is not correct!";
    }
    return "success";
  }

  bool failSuccess(String messege) {
    if (messege == "{\"username\":\"$UserName\",\"email\":\"$Email\"}") {
      return true;
    } else {
      return false;
    }
  }
}
