import 'package:flutter/material.dart';
import 'createCircuit.dart';
import 'signUp.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Chose Screen',
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'SignUp Screen',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewCourse()),
                    );
                  },
                  child: Text(
                    'new course',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
