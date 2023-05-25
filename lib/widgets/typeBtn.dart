import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/style.dart';

class ColorChangeButton extends StatelessWidget {
  final String imagePath;
  final Color defaultColor = ColorTheme.greyColor;
  final Color activeColor = ColorTheme.mainGreenColor;
  final bool isActive;
  final VoidCallback onPressed;

  const ColorChangeButton({
    Key? key,
    required this.imagePath,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Call the provided onPressed callback
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isActive ? activeColor : defaultColor,
          BlendMode.srcIn,
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
