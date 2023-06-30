import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/utils/resources/assets.dart';
import 'package:kuis_game/utils/widget/text_style.dart';

Dialog avatarPopupDialog(BuildContext _) {
  Widget avatarButton(String path) {
    return GestureDetector(
      onTap: () => Navigator.maybePop(_, path),
      child: SvgPicture.asset(path, width: 100, height: 100),
    );
  }

  return Dialog(
    backgroundColor: Colors.white,
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      width: 315,
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(_, null),
                child: const Icon(Icons.close, size: 26),
              ),
              Text(
                'Pilih Profil',
                style: myTextStyle(size: 20, weight: FontWeight.w500, color: AppColor.purple),
              ),
              const SizedBox(width: 26),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    avatarButton(LocalSvg.profil1),
                    avatarButton(LocalSvg.profil2),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    avatarButton(LocalSvg.profil3),
                    avatarButton(LocalSvg.profil4),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    avatarButton(LocalSvg.profil5),
                    avatarButton(LocalSvg.profil6),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
