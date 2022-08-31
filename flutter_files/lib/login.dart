import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LoginPost {
  String urL = "http://localhost:8000/login";
  late String resp;

  var _myHeader = {
    'Content-type': 'application/json',
  };

  Future<void> loginPost(
      String userName, String password) async {
    Uri url = Uri.parse(urL);

    var _myBody = {
      'username': userName,
      'password': password,
    };

    var response =
        await http.post(url, headers: _myHeader, body: jsonEncode(_myBody));
    resp = response.body;
    print(resp);
  }
}
