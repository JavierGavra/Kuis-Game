import 'package:flutter/material.dart';
import 'package:kuis_game/config/theme/theme.dart';
import 'package:kuis_game/ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home: const HomePage(),
    );
  }
}
