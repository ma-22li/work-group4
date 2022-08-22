import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class CreateCircPost {
  String urL = "http://127.0.0.1:8000/createCircute";
  late String resp;

  var _myHeader = {
    'Content-type': 'application/json',
  };

  String mousqeName;
  String name;
  String type;
  DateTime time;
  String catg;
  CreateCircPost(this.name, this.mousqeName, this.type, this.catg, this.time);

//String userName, String email, String password

  Future<String> createPost() async {
    Uri url = Uri.parse(urL);

    var _myBody = {
      'name': name,
      'musqname': mousqeName,
      'type': type,
      'time': time,
      'catg': catg,
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
