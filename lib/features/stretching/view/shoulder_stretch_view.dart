import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/widgets/stretch_common_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoulderStretchingView extends StatelessWidget {
  const ShoulderStretchingView({super.key});

  @override
  Widget build(BuildContext context) {
    StretchController stretchController = Get.find();
    stretchController.fetchShoulderTensionStretch();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Shoulder Stretch",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
            () => !stretchController.loading
            ? StretchCommonWidget(
          image: stretchController.shoulderTension.value!.image,
          time: "5 mins",
          cals: '0.5',
          description: "Shoulder stretching alleviates tension and improves mobility in the shoulder joints and surrounding muscles. It enhances flexibility, reduces stiffness, and promotes better posture and range of motion.",
          title1: "Neck Rolls",
          title2: "Shoulder Rolls",
          title3: "Shoulder Shrugs",
          subtitle1: stretchController.shoulderTension.value!.neckRolls,
          subtitle2: stretchController.shoulderTension.value!.shoulderRolls,
          subtitle3: stretchController.shoulderTension.value!.shoulderShrugs,
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
