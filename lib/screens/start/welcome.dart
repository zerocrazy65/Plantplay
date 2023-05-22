import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/authentication/login.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late AssetImage _backgroundImage;
  bool _isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _backgroundImage = const AssetImage('assets/img/plant_bg.jpg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadImage();
  }

  Future<void> _loadImage() async {
    await precacheImage(_backgroundImage, context);
    setState(() {
      _isImageLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isImageLoaded
          ? Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/plant_bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Welcome',
                      style: GoogleFonts.quicksand(
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          color: ColorTheme.introPageColor),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'we\'re glad that\nyou are here',
                      style: GoogleFonts.quicksand(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: ColorTheme.introPageColor),
                    ),
                    // const SizedBox(height: 250),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPage()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xD947734D)),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(250, 60)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: Text(
                                'Lets get started',
                                style: GoogleFonts.quicksand(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: ColorTheme.whiteColor),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ]),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
