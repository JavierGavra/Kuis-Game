import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuis_game/common/asset.dart';
import 'package:kuis_game/common/color.dart';
import 'package:kuis_game/ui/home/home_sound_button.dart';
import 'package:kuis_game/ui/home/home_status_bar.dart';
import 'package:kuis_game/ui/home/home_menu_button.dart';
import 'package:kuis_game/ui/widget/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int myPoin = 100;
  final int myNyawa = 5;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double bodyBottomPadding = screenSize.height - 729 >= 83 ? screenSize.height - 729 : 83;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 52),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeSoundButton(),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SvgPicture.asset(LocalSvg.profil1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  Text(
                    "Selamat Bermain",
                    style: myTextStyle(size: 24, weight: FontWeight.w500, color: AppColor.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 55),

            // Body
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: screenSize.width,
                  padding: EdgeInsets.fromLTRB(30, 65, 30, bodyBottomPadding),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeMenuButton(
                            imageUrl: LocalImages.kategoriBuah,
                            title: 'Tebak Nama Buah',
                            onTap: () {},
                          ),
                          HomeMenuButton(
                            imageUrl: LocalImages.kategoriHewan,
                            title: 'Tebak Nama Hewan',
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeMenuButton(
                            imageUrl: LocalImages.kategoriTransportasi,
                            title: 'Tebak Nama Transportasi',
                            onTap: () {},
                          ),
                          HomeMenuButton(
                            imageUrl: LocalImages.kategoriLagu,
                            title: 'Tebak Nama Lagu',
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Status Bar
                Positioned(top: -35, child: HomeStatusBar(poin: myPoin, nyawa: myNyawa)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}