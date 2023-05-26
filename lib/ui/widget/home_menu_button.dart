import 'package:flutter/material.dart';
import 'package:kuis_game/common/app_color.dart';

class HomeMenuButton extends StatefulWidget {
  const HomeMenuButton({super.key});

  @override
  State<HomeMenuButton> createState() => _HomeMenuButtonState();
}

class _HomeMenuButtonState extends State<HomeMenuButton> {
  bool isClicking = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Click"),
      onTapDown: (details) => setState(() => isClicking = true),
      onTapUp: (details) => setState(() => isClicking = false),
      onTapCancel: () => setState(() => isClicking = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(25, 3, 25, 5),
            decoration: BoxDecoration(
              color: const Color(0xffFFA51D),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Main",
              style: TextStyle(
                color: Colors.transparent,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 50),
            top: isClicking ? 0 : -4,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 3, 25, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFFBF5D),
                gradient: isClicking
                    ? null
                    : const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFFA51D), Color(0xffFFBF5D)],
                      ),
              ),
              child: Text(
                "Main",
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
