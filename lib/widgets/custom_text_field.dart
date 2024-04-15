import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColor.whiteSecondary,
        hintText: hintText,
        hintStyle: const TextStyle(color: CustomColor.hintDark),
        border: getOutlineInputBorder,
        focusedBorder: getOutlineInputBorder,
        enabledBorder: getOutlineInputBorder
      ),
    );
  }

  OutlineInputBorder get getOutlineInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
