import 'package:flutter/material.dart';
import 'package:kuis_game/common/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 50,
          color: AppColor.white,
        ),
      ),
    );
  }
}
