import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
                ImageAssets.kIntroImage3,
                height: Get.height * 0.35,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ReusableText(
              text: 'Stay Strong and Bold',
              align: TextAlign.center,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 30,
            ),
            const ReusableText(
              text:
              'We motivate each and everyone to\nstay fit in this fast paced world.\nIt is extremely essential to stay fit\nthus our goal is to provide fitness\nwithout any hassle.',
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