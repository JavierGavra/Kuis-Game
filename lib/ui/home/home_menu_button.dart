import 'package:flutter/material.dart';
import 'package:kuis_game/common/color.dart';
import 'package:kuis_game/ui/widget/button_3d.dart';
import 'package:kuis_game/ui/widget/text_style.dart';

class HomeMenuButton extends StatelessWidget {
  HomeMenuButton({super.key, required this.imageUrl, required this.title, required this.onTap});
  final String imageUrl;
  final String title;
  final Function() onTap;

  final TextStyle titleStyle = myTextStyle(
    size: 15,
    weight: FontWeight.w500,
    color: const Color(0xFFFFA51D),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 206,
      width: 147,
      decoration: BoxDecoration(
        color: const Color(0x40FFBA51),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 23, right: 23),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColor.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 10),
                Text(title, textAlign: TextAlign.center, style: titleStyle)
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            child: Button3D(
              onTap: onTap,
              padding: const EdgeInsets.fromLTRB(25, 3, 25, 5),
              backgroundColor: const Color(0xffFFA51D),
              focusedColor: const Color(0xffFFBF5D),
              borderRadius: BorderRadius.circular(20),
              child: Text(
                "Main",
                style: myTextStyle(color: AppColor.white, weight: FontWeight.w500, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
