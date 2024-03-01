import 'package:flutter/material.dart';

import 'text_widget.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.color,
    this.radius = 30,
    required this.onTap,
    required this.text,
  });

  final Color color;
  final double radius;
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(radius),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: 200.0,
        height: 42.0,
        child: BigText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
