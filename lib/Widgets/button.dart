import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class Button extends StatelessWidget {
  final String text;
  final double radius;
  final double height;
  final double width;
  final double fontSize;
  final Color fontColor;
  final Color btnColor;
  final Color borderColor;
  final double? borderWidth;
  final VoidCallback onTap;
  const Button(
      {super.key,
      this.text = "text",
      this.radius = 10,
      this.height = 50,
      this.width = double.infinity,
      this.fontSize = 19,
      this.fontColor = white,
      this.borderColor = green8f,
      this.borderWidth,
      this.onTap = defaultCallBack,
      this.btnColor = green8f});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: btnColor,
            border: borderWidth == null
                ? null
                : Border.all(width: borderWidth!, color: borderColor)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                color: fontColor,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
