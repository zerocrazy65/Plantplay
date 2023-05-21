import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000';
  } else {
    return 'http://localhost:3000';
  } // for iOS simulator
}

String? currentEmail;

void signupReq(fname, lname, email, password) async {
  await http.post(Uri.parse("${_localhost()}/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname.text,
        'lname': lname.text,
        'email': email.text,
        'password': password.text,
      }));
  currentEmail = email.text;
}

Future<String> signinReq(email, password) async {
  final res = await http.post(Uri.parse("${_localhost()}/signin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email.text,
        'password': password.text,
      }));
  currentEmail = email.text;
  return res.body;
}
