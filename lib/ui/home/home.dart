import 'package:flutter/material.dart';
import 'package:kuis_game/common/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuis_game/ui/widget/home_menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 600.h,
                width: screenSize.width,
                padding: EdgeInsets.fromLTRB(30, 65, 30, 0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)).r,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 206.h,
                          width: 147.h,
                          decoration: BoxDecoration(
                            color: Color(0x40FFBA51),
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                        ),
                        Container(
                          height: 206.h,
                          width: 147.h,
                          decoration: BoxDecoration(
                            color: Color(0x40FFBA51),
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 206.h,
                          width: 147.h,
                          decoration: BoxDecoration(
                            color: Color(0x40FFBA51),
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                        ),
                        Container(
                          height: 206.h,
                          width: 147.h,
                          decoration: BoxDecoration(
                            color: Color(0x40FFBA51),
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 177.h,
              left: 30.w,
              child: Container(
                height: 70.h,
                width: 315.w,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(width: 3, color: Color(0xffE4E4E4)),
                  borderRadius: BorderRadius.circular(20).r,
                  boxShadow: const [
                    BoxShadow(offset: Offset(0, 5), color: Color(0xffD7D7D7))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
