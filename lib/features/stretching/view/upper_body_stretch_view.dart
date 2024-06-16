import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/widgets/stretch_common_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpperBodyStretchingView extends StatelessWidget {
  const UpperBodyStretchingView({super.key});

  @override
  Widget build(BuildContext context) {
    StretchController stretchController = Get.find();
    stretchController.fetchUpperBodyStretch();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Upper Body Stretching",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
            () => !stretchController.loading
            ? StretchCommonWidget(
          image: stretchController.upperBodyStretching.value!.image,
          time: "7 mins",
          cals: '0.78',
          description: "Upper body stretching targets muscles in the arms, shoulders, chest, and back, relieving tension and promoting flexibility. It enhances posture, reduces muscle stiffness, and improves overall upper body mobility and function.",
          title1: "Chest Opener",
          title2: "Triceps Stretch",
          subtitle1: stretchController.upperBodyStretching.value!.chestOpener,
          subtitle2: stretchController.upperBodyStretching.value!.tricepsStretch,
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
