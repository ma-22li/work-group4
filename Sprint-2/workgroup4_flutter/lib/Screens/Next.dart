import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: [
          Text(
            "You Created The Circuit Successfully!",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
          SizedBox(height: 20),
          Image.network(
            "https://www.interweave.in/wp-content/themes/interweave-theme/images/success.png",
            scale: 2,
          )
        ],
      ),
    );
  }
}
