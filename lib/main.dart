import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/shopping/navbar.dart';
import 'package:flutter_application_1/screens/start/splash.dart';

void main() async {
  // Initialize Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: MyApplication()));
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}
