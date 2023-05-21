import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/shopping/store.dart';

String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000';
  } else {
    return 'http://localhost:3000';
  } // for iOS simulator
}

class userRegis {
  final String? fname;
  final String? lname;
  final String? email;
  final String? password;

  userRegis({this.fname, this.lname, this.email, this.password});
}

void signupReq(fname, lname, email, password) async {
  final res = await http.post(Uri.parse("${_localhost()}/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname.text,
        'lname': lname.text,
        'email': email.text,
        'password': password.text,
      }));
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
  return res.body;
}
