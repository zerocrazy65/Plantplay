import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cartProviders.dart';
import 'package:flutter_application_1/screens/authentication/login.dart';

import 'package:flutter_application_1/widgets/navbar.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApplication(),
    ),
  );
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      home: NavBar(),
    );
  }
}
