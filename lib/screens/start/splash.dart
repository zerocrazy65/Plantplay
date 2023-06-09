import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/start/welcome.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: ColorTheme.introPageColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/PlantPlay_Splash.png", width: 100),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Plant'.toUpperCase(),
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      color: ColorTheme.whiteColor,
                      fontSize: 38,
                    )),
                Text(
                  'Play'.toUpperCase(),
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.highlightColor,
                    fontSize: 38,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
