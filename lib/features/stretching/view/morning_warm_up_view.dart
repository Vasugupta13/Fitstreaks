import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/widgets/stretch_common_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorningWarmUpView extends StatelessWidget {
  const MorningWarmUpView({super.key});

  @override
  Widget build(BuildContext context) {
    StretchController stretchController = Get.find();
    stretchController.fetchMorningWarmUp();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Morning Warm-ups",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
            () => !stretchController.loading
            ? StretchCommonWidget(
          image: stretchController.morningWarmup.value!.image,
          time: "7 mins",
          cals: '0.78',
          description: "Morning warmups invigorate the body, preparing it for the day ahead. Incorporating dynamic movements and light cardio boosts circulation, flexibility, and mental alertness, setting a positive tone for the day.",
          title1: "Dynamic Movements",
          title2: "Light Cardio",
          subtitle1: stretchController.morningWarmup.value!.dynamicMovements,
          subtitle2: stretchController.morningWarmup.value!.lightCardio,
        )
            : const Center(
          child: CircularProgressIndicator(
            color: AppColors.kOrangeColor,
          ),
        ),
      ),
    );
  }
}
