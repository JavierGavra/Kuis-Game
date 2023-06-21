import 'package:flutter/material.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/utils/widget/back_button_3d.dart';
import 'package:kuis_game/utils/widget/text_style.dart';

class LevelAppBar extends StatelessWidget {
  const LevelAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackButton3D(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Center(
              child: Text(
                "Tebak Nama ${title.substring(0, 1).toUpperCase() + title.substring(1)}",
                textAlign: TextAlign.center,
                style: myTextStyle(size: 20, weight: FontWeight.w500, color: AppColor.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}
