import 'package:flutter/material.dart';

TextStyle myTextStyle({double? size, FontWeight? weight, Color? color}) {
  return TextStyle(
    fontSize: size ?? 14,
    fontWeight: weight ?? FontWeight.w400,
    color: color ?? Colors.black,
    height: 1.21,
  );
}
