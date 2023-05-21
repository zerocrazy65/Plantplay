import 'package:flutter/material.dart';
import 'package:flutter_application_1/middleware/connect.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(currentEmail ?? ''),
      ),
    );
  }
}
