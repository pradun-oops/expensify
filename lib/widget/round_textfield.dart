import 'package:expensify/helper/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obsecured;
  final Color? bgColor;
  final Widget? left;
  const RoundTextfield({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.obsecured = false,
    this.bgColor,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? TColor.textfield,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (left != null)
            Padding(padding: const EdgeInsets.only(left: 10), child: left!),
          Expanded(
            child: TextField(
              keyboardType: keyboardType,
              autocorrect: false,
              controller: controller,
              obscureText: obsecured,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: TColor.placeholder,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
