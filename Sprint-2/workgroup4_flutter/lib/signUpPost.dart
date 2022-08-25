import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SignUpPost {
  String urL = "http://127.0.0.1:8000/register";
  String resp = "Hello";

  var _myHeader = {
    'Content-type': 'application/json',
  };

  String email;
  String userName;
  String password;
  SignUpPost(this.userName, this.email, this.password);

//String userName, String email, String password

  Future<String?> signUpPost() async {
    Uri url = Uri.parse(urL);

    var _myBody = {
      'username': userName,
      'email': email,
      'password': password,
    };
    try {
      var response =
          await http.post(url, headers: _myHeader, body: jsonEncode(_myBody));
      resp = response.body;
      return resp;
    } catch (e) {
      return "Error has occurd : + $e";
    }
  }

  String getResp() {
    return resp;
  }
}
