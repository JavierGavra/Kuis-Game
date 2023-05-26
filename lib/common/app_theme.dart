import 'package:flutter/material.dart';
import 'package:kuis_game/common/app_color.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Fredoka',
      scaffoldBackgroundColor: AppColor.purple,
    );
  }
}
