import 'package:flutter/material.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/utils/widget/button_3d.dart';

class HomeSoundButton extends StatefulWidget {
  const HomeSoundButton({super.key});

  @override
  State<HomeSoundButton> createState() => _HomeSoundButtonState();
}

class _HomeSoundButtonState extends State<HomeSoundButton> {
  bool isSongOn = true;

  @override
  Widget build(BuildContext context) {
    return Button3D(
      onTap: () => setState(() => isSongOn = !isSongOn),
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(50),
      child: Icon(
        isSongOn ? Icons.volume_up : Icons.volume_off,
        size: 30,
        color: isSongOn ? AppColor.white : Colors.black45,
      ),
    );
  }
}
