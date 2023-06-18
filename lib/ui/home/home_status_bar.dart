import 'package:flutter/material.dart';
import 'package:kuis_game/common/color.dart';
import 'package:kuis_game/ui/widget/text_style.dart';

class HomeStatusBar extends StatelessWidget {
  const HomeStatusBar({super.key, required this.poin, required this.nyawa});
  final int poin;
  final int nyawa;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: 70,
      width: screenSize.width - 30 * 2,
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(width: 3, color: const Color(0xffE4E4E4)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(offset: Offset(0, 5), color: Color(0xffD7D7D7))],
      ),
      child: Row(
        children: [
          _buildInfo(varian: 0),
          Container(height: 54, width: 2, color: const Color(0xffD7D7D7)),
          _buildInfo(varian: 1),
        ],
      ),
    );
  }

  Widget _buildInfo({required int varian}) {
    assert(varian <= 1);
    IconData icon = varian == 0 ? Icons.star : Icons.favorite;
    String title = varian == 0 ? 'Poin kamu' : 'Nyawa Kamu';
    String content = varian == 0 ? '$poin Poin' : '$nyawa Nyawa';
    Color color = varian == 0 ? AppColor.blue : AppColor.pink;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: myTextStyle(size: 13, color: const Color(0xff797979))),
                Text(
                  content,
                  style: myTextStyle(size: 18, weight: FontWeight.w500, color: color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
