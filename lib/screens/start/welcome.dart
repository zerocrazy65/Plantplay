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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo/PlantPlay_noText.png"),
            fit: BoxFit.cover,
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              'Welcome',
              style: GoogleFonts.quicksand(
                fontSize: 64,
                fontWeight: FontWeight.w600,
                color: ColorTheme.introPageColor
              ),
            ),
            const SizedBox(height: 45),
            Text(
              'we\'re glad that\nyou are here',
              style: GoogleFonts.quicksand(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: ColorTheme.introPageColor
              ),
            ),
            const SizedBox(height: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const LoginPage())
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xD947734D)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(250, 60)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))
                    )
                  ),
                  child: Center(child: 
                    Text(
                      'Lets get started',
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: ColorTheme.whiteColor
                      ),
                    ),
                  )
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}