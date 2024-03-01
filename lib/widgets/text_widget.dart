import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.textOverflow = TextOverflow.fade,
    this.color = Colors.black,
  });
  final String text;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final Color color;
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = controller.isDarkMode.value;
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          overflow: textOverflow,
          fontWeight: fontWeight,
          color: color),
    );
  }
}

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.textOverflow = TextOverflow.fade,
    this.color=Colors.black
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final Color color;
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = controller.isDarkMode.value;
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        overflow: textOverflow,
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
}
