import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTheme {
  static final TextStyle quicksand = GoogleFonts.quicksand();
  static final TextStyle manjari = GoogleFonts.manjari();

  static TextStyle headerText = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    color: ColorTheme.purpleColor,
    fontFamily: manjari.fontFamily,
  );
  static TextStyle bodyText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: ColorTheme.purpleColor,
    fontFamily: quicksand.fontFamily,
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: quicksand.fontFamily,
  );
  static TextStyle detailText = TextStyle(
    fontSize: 12.0,
    letterSpacing: 0.5,
    fontWeight: FontWeight.bold,
    color: ColorTheme.greyColor,
    fontFamily: quicksand.fontFamily,
  );
  static TextStyle subBodyText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: ColorTheme.greyColor,
    fontFamily: quicksand.fontFamily,
  );
  static TextStyle errorText = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
    color: Colors.red,
    fontFamily: quicksand.fontFamily,
  );
}

class ColorTheme {
  static const Color greyColor = Color.fromARGB(255, 152, 155, 158);
  static const Color whiteColor = Color(0xfff0f0f0);
  static const Color bgCartColor = Color(0xFFECECEC);
  static const Color blurGreenColor = Color(0xFFD7E6D9);
  static const Color mainGreenColor = Color(0xFF47734D);
  static const Color highlightColor = Color(0xFF1C9E73);
  static const Color introPageColor = Color(0xFF447055);
  static const Color purpleColor = Color(0xff312E49);
  static const Color redButtonColor = Color(0xffC73E3E);
}
