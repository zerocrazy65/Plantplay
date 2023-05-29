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
bool isLogin = false;

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
        name: value["p_name"],
        price: value["p_price"],
      );
      items.add(item);
    });
    return items;
  } catch (e) {
    print('Error during storeReq(): $e');
    return [];
  }
}

class Item {
  final int? id;
  final String? img;
  final String? type;
  final String? name;
  final int? price;

  Item({
    this.id,
    this.img,
    this.type,
    this.name,
    this.price,
  });
}

Future<List<ProductConstructor>> productReq(id) async {
  final res = await http.get(Uri.parse("${_localhost()}/store/$id"));
  var resData = json.decode(res.body) as List<dynamic>;

  print(resData);

  List<ProductConstructor> product = resData.map((productData) {
    return ProductConstructor(
      id: productData['p_id'],
      img: productData['p_img'],
      name: productData['p_name'],
      price: productData['p_price'],
      describe: productData['p_describe'],
      type: productData['p_type'],
      rating: productData['p_rating'],
      light: productData['pd_light'],
      temp: productData['pd_temp'],
      water: productData['pd_water'],
    );
  }).toList();

  return product;
}

class ProductConstructor {
  final int? id;
  final int? light;
  final int? temp;
  final int? water;
  final String? img;
  final String? type;
  final String? name;
  final int? price;
  final String? describe;
  final int? rating;

  ProductConstructor({
    this.id,
    this.light,
    this.temp,
    this.water,
    this.img,
    this.type,
    this.name,
    this.price,
    this.describe,
    this.rating,
  });
}

Future<List<UserConstructor>> userReq(String currentEmail) async {
  final res =
      await http.get(Uri.parse("${_localhost()}/account/$currentEmail"));
  var resData = json.decode(res.body);
  // Creating a list to store input data
  List<UserConstructor> users = resData.values.map<UserConstructor>((userData) {
    return UserConstructor(
      fname: userData["u_first"],
      lname: userData["u_last"],
    );
  }).toList();

  return users;
}

class UserConstructor {
  final String? fname;
  final String? lname;

  UserConstructor({
    this.fname,
    this.lname,
  });
}

Future<String> recordSlip(email, p_id) async {
  final res = await http.post(Uri.parse("${_localhost()}/record-slip"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'p_id': p_id,
      }));
  return res.body;
}
