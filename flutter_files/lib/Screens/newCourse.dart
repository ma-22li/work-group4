import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NewCourse extends StatefulWidget {
  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chek;
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
                  controller: _nameController,
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
                child: TextField(
                  obscureText: false,
                  onChanged: (value) {
                    //name = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Kind of Class',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Kind of the Class',
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
                    labelText: 'Time of Class',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Time of the Class',
                  ),
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
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: (){},
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
