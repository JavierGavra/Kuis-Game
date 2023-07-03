import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/service/user_local_database.dart';
import 'package:kuis_game/ui/home/pages/home_page.dart';
import 'package:kuis_game/ui/register/pages/register_page.dart';
import 'package:kuis_game/utils/navigate/navigate.dart';
import 'package:kuis_game/utils/widget/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void checkUserHasLogged(BuildContext _) async {
    var user = await UserLocalDatabase.instance.getUser();
    Timer(const Duration(seconds: 3), () {
      Navigate.pushAndRemove(_, user != null ? const HomePage() : const RegisterPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    checkUserHasLogged(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini Splash screen', style: myTextStyle(size: 20, color: AppColor.white)),
            const SizedBox(height: 10),
            Container(height: 50, width: 50, color: AppColor.white),
          ],
        ),
      ),
    );
  }
}
