import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuis_game/model/user_model.dart';
import 'package:kuis_game/service/user_local_database.dart';
import 'package:kuis_game/ui/level/pages/level_page.dart';
import 'package:kuis_game/utils/navigate/navigate.dart';
import 'package:kuis_game/utils/resources/assets.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/ui/home/widgets/home_sound_button.dart';
import 'package:kuis_game/ui/home/widgets/home_status_bar.dart';
import 'package:kuis_game/ui/home/widgets/home_menu_button.dart';
import 'package:kuis_game/utils/widget/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  bool isLoading = true;

  void getUserData() async {
    user = await UserLocalDatabase.instance.getUser();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double bodyBottomPadding = screenSize.height - 729 >= 83 ? screenSize.height - 729 : 83;

    return Scaffold(
      body: isLoading
          ? null
          : SingleChildScrollView(
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
                                  child: SvgPicture.asset(user!.imagePath!),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "Selamat Bermain",
                          style:
                              myTextStyle(size: 24, weight: FontWeight.w500, color: AppColor.white),
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
                                  onTap: () =>
                                      Navigate.push(context, const LevelPage(kategori: 'buah')),
                                ),
                                HomeMenuButton(
                                  imageUrl: LocalImages.kategoriHewan,
                                  title: 'Tebak Nama Hewan',
                                  onTap: () =>
                                      Navigate.push(context, const LevelPage(kategori: 'hewan')),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeMenuButton(
                                  imageUrl: LocalImages.kategoriTransportasi,
                                  title: 'Tebak Nama Kendaraan',
                                  onTap: () => Navigate.push(
                                      context, const LevelPage(kategori: 'kendaraan')),
                                ),
                                HomeMenuButton(
                                  imageUrl: LocalImages.kategoriLagu,
                                  title: 'Tebak Nama Lagu',
                                  onTap: () =>
                                      Navigate.push(context, const LevelPage(kategori: 'lagu')),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Status Bar
                      Positioned(
                          top: -35, child: HomeStatusBar(poin: user!.point!, nyawa: user!.nyawa!)),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
