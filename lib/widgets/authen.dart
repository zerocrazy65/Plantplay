import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../theme/style.dart';

Widget submitButton(header) {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTheme.mainGreenColor, // Set the background colo
      ),
      child: Center(
        child: Text(header, style: FontTheme.buttonText),
      ));
}
