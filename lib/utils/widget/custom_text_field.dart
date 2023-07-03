import 'package:flutter/material.dart';
import 'package:kuis_game/config/theme/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.autoFocus = false,
  });
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool autoFocus;

  final _textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 5, color: Color(0x51FFFFFF)),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 15,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
        decorationColor: AppColor.white,
      ),
      cursorColor: AppColor.white,
      autofocus: autoFocus,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color(0x51FFFFFF),
        ),
        filled: true,
        fillColor: const Color(0x28D9D9D9),
        counterText: "",
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        border: _textFieldBorder,
        enabledBorder: _textFieldBorder,
        focusedBorder: _textFieldBorder,
      ),
    );
  }
}
