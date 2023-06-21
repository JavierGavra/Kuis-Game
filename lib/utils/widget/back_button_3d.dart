import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/utils/navigate/navigate.dart';
import 'package:kuis_game/utils/resources/assets.dart';
import 'package:kuis_game/utils/widget/button_3d.dart';

class BackButton3D extends StatelessWidget {
  const BackButton3D({super.key});

  @override
  Widget build(BuildContext context) {
    return Button3D(
      onTap: () => Navigate.maybePop(context),
      elevation: 5,
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(70),
      foregroundColor: [AppColor.white, AppColor.white],
      backgroundColor: const Color(0xffD7D7D7),
      focusedColor: AppColor.white,
      child: SvgPicture.asset(LocalSvg.iconBack),
    );
  }
}
