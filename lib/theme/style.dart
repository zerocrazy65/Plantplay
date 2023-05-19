import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTheme {
  static const Color primaryColor = Color.fromARGB(255, 152, 155, 158);
  static const Color secondaryColor = Color(0xff312E49);
  static final TextStyle primaryFontStyle = GoogleFonts.quicksand();
  static final TextStyle fontStyle = GoogleFonts.manjari();

  static TextStyle headerText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32.0,
    color: secondaryColor,
    fontFamily: fontStyle.fontFamily,
  );
  static TextStyle bodyText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
    fontFamily: primaryFontStyle.fontFamily,
  );
  static TextStyle subBodyText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    fontFamily: primaryFontStyle.fontFamily,
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: primaryFontStyle.fontFamily,
  );
}

class ColorTheme {
  static const Color whiteColor = Color(0xfff0f0f0);
  static const Color mainGreenColor = Color(0xFF47734D);
  static const Color highlightColor = Color(0xFF1C9E73);
  static const Color introPageColor = Color(0xFF447055);
}
