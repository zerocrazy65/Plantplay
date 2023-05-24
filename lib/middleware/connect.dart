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

Future<List<Item>> storeReq() async {
  try {
    final res = await http.get(Uri.parse("${_localhost()}/store"));
    var resData = json.decode(res.body);
    // Creating a list to store input data
    List<Item> items = [];
    resData.forEach((index, value) {
      Item item = Item(
        id: value["p_id"],
        img: value["p_img"],
        type: value["p_type"],
        name: value["p_name"], // Fix the value for the name field
        price: value["p_price"], // Fix the value for the price field
        describe: value["describe"],
        rating: value["p_rating"],
      );
      items.add(item);
    });
    return items;
  } catch (e) {
    // Handle the error (e.g., log the error, display an error message, etc.)
    print('Error during storeReq(): $e');
    return []; // Return an empty list or null depending on your error handling strategy
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
