import 'package:flutter/material.dart';

class Navigate {
  static void push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (c) => widget));
  }

  static void replacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => widget));
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (c) => widget), (route) => false);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void maybePop(BuildContext context) {
    Navigator.maybePop(context);
  }
}
