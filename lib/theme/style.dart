import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTheme {
  static const Color fade = Color(0x00a2a2a6);
  static const Color primaryColor = Color(0xff747980);
  static const Color purple = Color(0xff312E49);
  static final TextStyle fontStyle = GoogleFonts.quicksand();

  static TextStyle headerText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    color: purple,
    fontFamily: fontStyle.fontFamily,
  );
  static TextStyle bodyText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: primaryColor,
    fontFamily: fontStyle.fontFamily,
  );
  static TextStyle subBodyText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: fade,
    fontFamily: fontStyle.fontFamily,
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: fontStyle.fontFamily,
  );
}

class ColorTheme {
  static const Color whiteColor = Color(0xfff0f0f0);
  static const Color mainGreenColor = Color(0xFF47734D);
  static const Color highlightColor = Color(0xFF1C9E73);
  static const Color introPageColor = Color(0xFF447055);
}
