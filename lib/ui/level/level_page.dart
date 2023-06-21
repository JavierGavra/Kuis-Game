import 'package:flutter/material.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/ui/level/level_appbar.dart';
import 'package:kuis_game/utils/widget/button_3d.dart';
import 'package:kuis_game/utils/widget/text_style.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key, required this.kategori});
  final String kategori;
  final int _level = 50;
  final int _myLevel = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 52, left: 30, right: 30, bottom: 70),
        child: Column(
          children: [
            LevelAppBar(title: kategori),
            const SizedBox(height: 28),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 50),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 30,
                  children: List<Widget>.generate(
                    _level,
                    growable: false,
                    (index) {
                      if ((index + 1) < _myLevel) {
                        return _buildLevelCompleted(index);
                      } else if ((index + 1) == _myLevel) {
                        return _buildLevelNow(index);
                      } else {
                        return _buildLevelUncompleted(index);
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLevelCompleted(int index) {
    return Button3D(
      onTap: () {},
      width: 64,
      height: 64,
      foregroundColor: [AppColor.blue, const Color(0xff6CF4FF)],
      backgroundColor: const Color(0xff34D8E5),
      focusedColor: const Color(0xff34D8E5),
      borderRadius: BorderRadius.circular(10),
      child: Center(
        child: Text(
          '${index + 1}',
          style: myTextStyle(size: 30, weight: FontWeight.w500, color: AppColor.white),
        ),
      ),
    );
  }

  Widget _buildLevelNow(int index) {
    return Button3D(
      onTap: () {},
      width: 64,
      height: 64,
      foregroundColor: [AppColor.pink, const Color(0xffFF9BCC)],
      backgroundColor: const Color(0xffF46AAE),
      focusedColor: const Color(0xffF46AAE),
      borderRadius: BorderRadius.circular(10),
      child: Center(
        child: Text(
          '${index + 1}',
          style: myTextStyle(size: 30, weight: FontWeight.w500, color: AppColor.white),
        ),
      ),
    );
  }

  Widget _buildLevelUncompleted(int index) {
    return Button3D(
      onTap: null,
      width: 64,
      height: 64,
      borderRadius: BorderRadius.circular(10),
      child: Center(child: Icon(Icons.lock, size: 30, color: AppColor.white)),
    );
  }
}
