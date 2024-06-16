import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:fitstreaks/features/diet_plan/controller/diet_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietPlanSuggestionWidget extends StatelessWidget {
  const DietPlanSuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DietController dietController = Get.find();
    double autoScale = Get.width / 400;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * autoScale, vertical: 20 * autoScale),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 12, color: AppColors.kGreyColor.withOpacity(0.4))
            ]),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20 * autoScale, vertical: 20 * autoScale),
            child: Obx(
              () => !dietController.loading.value
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    text: "Maintenance calories",
                                    size: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kGreyColor,
                                  ),
                                  ReusableText(
                                      text: dietController.maintenanceCals.value
                                          .toString(),
                                      size: 22,
                                      fontWeight: FontWeight.w600),
                                  ReusableText(
                                    text: "You should go for",
                                    size: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kGreyColor,
                                  ),
                                  ReusableText(
                                    text: dietController.calSuggestion.value
                                        .toString(),
                                    size: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  CircularSeekBar(
                                    trackColor: AppColors.kLightGreyColor,
                                    width: double.infinity,
                                    height: 140,
                                    maxProgress: 40,
                                    progress: dietController.bmi.value,
                                    barWidth: 8,
                                    startAngle: 45,
                                    strokeCap: StrokeCap.round,
                                    progressGradientColors: const [
                                      Colors.yellow,
                                      AppColors.kGreenColor,
                                      AppColors.kRedAccent
                                    ],
                                    dashWidth: 80,
                                    dashGap: 15,
                                    animation: true,
                                    interactive: false,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const ReusableText(
                                          text: "BMI",
                                          size: 10,
                                        ),
                                        ReusableText(
                                          text: dietController.bmi
                                              .toStringAsFixed(2),
                                          size: 22,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              dietController.bmiStatus.value ==
                                                      "Underweight"
                                                  ? AppColors.kYellowColor
                                                  : dietController.bmiStatus
                                                              .value ==
                                                          "Normal"
                                                      ? AppColors.kGreenColor
                                                      : AppColors.kRedAccent,
                                        ),
                                        ReusableText(
                                          text: dietController.bmiStatus.value,
                                          size: 13,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ReusableText(
                          text: dietController.planSuggestion.value,
                          size: 12,
                          color: AppColors.kGreyColor.withOpacity(0.9),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  : SizedBox(
                      height: Get.height * 0.2,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kYellowColor,
                        ),
                      ),
                    ),
            ),
        ),
      ),
    );
  }
}
