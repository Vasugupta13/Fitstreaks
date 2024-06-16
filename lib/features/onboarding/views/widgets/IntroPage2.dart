import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.kBackGroundColor,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                ImageAssets.kIntroImage2,
                height: Get.height * 0.35,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ReusableText(
              text: 'Flexibility Of Training',
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 30,
            ),
            const ReusableText(
              text:
              'Train from anywhere anytime\n Fitstreaks provide home based exercise,\nstretching and zumba that can\neasily be done flexibly and conveniently\nand without any machines and major equipments',
              align: TextAlign.center,
              size: 18,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}