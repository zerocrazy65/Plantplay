// TODO: this code is example of http request (not use)

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Play',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future? serverResponse;
  Future showData() async {
    final res = await http.get(Uri.parse("${_localhost()}/store"));
    print(res.body); // Add this line to print the response body
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(children: <Widget>[
        Center(
            child: ElevatedButton(
          onPressed: (() {
            setState(() {
              serverResponse = showData();
            });
          }),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: const Text('Show data'),
        )),
        FutureBuilder(
            future: serverResponse,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text("No data"),
                  // child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(snapshot.data[index].p_id.toString()),
                          Text(snapshot.data[index].p_name),
                          Text(snapshot.data[index].p_type)
                        ],
                      );
                    }));
              }
            })
      ]),
    );
  }
}

String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000';
  } else {
    return 'http://localhost:3000';
  }
}

class Item {
  final int? id;
  final String? img;
  final String? type;
  final String? name;
  final int? price;
  final String? describe;
  final int? rating;

  Item({
    this.id,
    this.img,
    this.type,
    this.name,
    this.price,
    this.describe,
    this.rating,
  });
}
