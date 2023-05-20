import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/authentication/signup.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:flutter_application_1/widgets/authen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool obscurePassword = true;

  String header = 'Login';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // ? ----- UI ----- //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),
              Text(
                header,
                style: FontTheme.headerText,
              ),
              const SizedBox(height: 30),
              Text(
                'E-mail',
                style: FontTheme.bodyText,
              ),
              const SizedBox(height: 6),
              _entryField('Your Email', _controllerEmail),
              const SizedBox(height: 16),
              Text(
                'Password',
                style: FontTheme.bodyText,
              ),
              const SizedBox(height: 6),
              _entryField('Your Password', _controllerPassword),
              const SizedBox(height: 20),
              _swapAuthenText(),
              const SizedBox(height: 40),
              submitButton(header)
            ]),
      )),
    );
  }

  // ? ----- Widgets ----- //

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    bool isPassword = title == 'Your Password';

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: FontTheme.subBodyText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        prefixIcon: Icon(
          isPassword ? Icons.lock : Icons.mail,
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
      obscureText: isPassword ? obscurePassword : false,
    );
  }

  Widget _errorMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(errorMessage == '' ? '' : 'error: $errorMessage',
          style: const TextStyle(color: Colors.red)),
    );
  }

  Widget _swapAuthenText() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: FontTheme.subBodyText,
          children: [
            TextSpan(
              text: "Signup",
              style: FontTheme.subBodyText.copyWith(
                color: ColorTheme.highlightColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}