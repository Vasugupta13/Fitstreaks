import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/widgets/stretch_common_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LowerBodyStretchView extends StatelessWidget {
  const LowerBodyStretchView({super.key});

  @override
  Widget build(BuildContext context) {
    StretchController stretchController = Get.find();
    stretchController.fetchLowerBodyStretch();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Lower body Stretching",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => !stretchController.loading
            ? StretchCommonWidget(
                image: stretchController.lowerBodyStretching.value!.image,
                time: "5-8 mins",
                cals: '0.9',
                description:
                    "Lower body stretching enhances flexibility and mobility in the legs, hips, and lower back. It targets muscles like the hamstrings, quadriceps, and calves, aiding in improved posture and reduced tension.",
                title1: "Butterfly Stretch",
                title2: "Hamstring Stretch",
                title3: "Standing quad Stretch",
                subtitle1: stretchController
                    .lowerBodyStretching.value!.butterflyStretch,
                subtitle2: stretchController
                    .lowerBodyStretching.value!.hamstringStretch,
                subtitle3: stretchController
                    .lowerBodyStretching.value!.standingQuadStretch,
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
