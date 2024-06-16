import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
                ImageAssets.kIntroImage1,
                height: Get.height * 0.35,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ReusableText(
              text: 'Ease of Usage for Differently\nable as well.',
              size: 20,
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const ReusableText(
              text:
                  'Fit Streaks provides special plans for\neveryone. Including differently abled\npeople as well, hence helping them\nto achieve their fitness goals.',
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
