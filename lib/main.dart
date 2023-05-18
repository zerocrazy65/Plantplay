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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future? serverResponse;
  Future<List<Item>> showData() async {
    final response = await http.get(Uri.parse(_localhost() + "/showDB"));
    var responseData = json.decode(response.body);
    //Creating a list to store input data;
    List<Item> items = [];
    responseData.forEach((index, value) {
      Item item = Item(
          id: value["user_id"],
          username: value["username"],
          password: value["password"]);
      items.add(item);
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(children: <Widget>[
        Center(
            child: ElevatedButton(
          onPressed: (() {
            setState(() {
              serverResponse = showData();
            });
          }),
          child: Text('Show data'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
        )),
        FutureBuilder(
            future: serverResponse,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("No data"),
                    // child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data[index].id.toString()),
                            Text(snapshot.data[index].username),
                            Text(snapshot.data[index].password)
                          ],
                        ),
                      );
                    }));
              }
            })
      ]),
    );
  }
}

String _localhost() {
  if (Platform.isAndroid)
    return 'http://10.0.2.2:3000';
  else // for iOS simulator
    return 'http://localhost:3000';
}

class Item {
  final int? id;
  final String? username;
  final String? password;

  Item({
    this.id,
    this.username,
    this.password,
  });
}
