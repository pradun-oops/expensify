import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  const CustomText({
    super.key,
    required this.text,
    this.size = 20,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size, color: color));
  }
}
