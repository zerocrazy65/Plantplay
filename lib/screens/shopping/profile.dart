import 'package:flutter/material.dart';
import 'package:flutter_application_1/middleware/connect.dart';
import 'package:flutter_application_1/screens/authentication/login.dart';

import '../../theme/style.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  Future<List<UserConstructor>>? userInfo;
  @override
  void initState() {
    super.initState();
    userInfo = userReq(currentEmail!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: userInfo,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              String? fname = snapshot.data[0].fname;
              String? lname = snapshot.data[0].lname;
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: FontTheme.headerText,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'First Name',
                      style: FontTheme.bodyText,
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(fname!),
                    const SizedBox(height: 15),
                    Text(
                      'Last Name',
                      style: FontTheme.bodyText,
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(lname!),
                    const SizedBox(height: 15),
                    Text(
                      'E-mail',
                      style: FontTheme.bodyText,
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(currentEmail!),
                    const SizedBox(height: 20),
                    _signOutButton(),
                  ],
                ),
              );
            }
            ;
          }),
    );
  }

  Widget _buildInputField(String text) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: FontTheme.subBodyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signOutButton() {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                    (_) => false,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorTheme.mainGreenColor),
                ),
                child: Text('Log out', style: FontTheme.buttonText)))
      ]),
    );
  }
}
