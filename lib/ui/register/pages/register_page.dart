import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuis_game/config/theme/color.dart';
import 'package:kuis_game/ui/home/pages/home_page.dart';
import 'package:kuis_game/ui/register/widget/avatar_popup_dialog.dart';
import 'package:kuis_game/utils/navigate/navigate.dart';
import 'package:kuis_game/utils/widget/button_3d.dart';
import 'package:kuis_game/utils/widget/text_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _textController = TextEditingController();
  final ValueNotifier<String?> imageProfil = ValueNotifier(null);
  final _textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 5, color: Color(0x51FFFFFF)),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenSize.width,
        margin: const EdgeInsets.only(top: 65, bottom: 77, left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Buat Profilmu",
              style: myTextStyle(size: 24, weight: FontWeight.w500, color: AppColor.white),
            ),
            const SizedBox(height: 56),
            SizedBox(
              height: 150 + 30,
              width: 150,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  ValueListenableBuilder(
                    valueListenable: imageProfil,
                    builder: (context, value, child) {
                      return Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD9D9D9),
                        ),
                        child: value != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: SvgPicture.asset(value))
                            : null,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Button3D(
                      onTap: () async {
                        String? getProfil = await showDialog(
                          context: context,
                          useSafeArea: true,
                          builder: (context) => avatarPopupDialog(context),
                        );
                        imageProfil.value = getProfil ?? imageProfil.value;
                      },
                      elevation: 5,
                      padding: const EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(Icons.edit, color: AppColor.white, size: 30),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: _textController,
              maxLength: 15,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
                decorationColor: AppColor.white,
              ),
              cursorColor: AppColor.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x28D9D9D9),
                counterText: "",
                contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                border: _textFieldBorder,
                enabledBorder: _textFieldBorder,
                focusedBorder: _textFieldBorder,
              ),
            ),
            const Spacer(),
            Button3D(
              onTap: () {
                print(_textController.text);
                Navigate.pushAndRemove(context, const HomePage());
              },
              elevation: 5,
              height: 50,
              width: screenSize.width - 30 - 30,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Text(
                  'Lanjut',
                  style: myTextStyle(size: 18, weight: FontWeight.w500, color: AppColor.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
