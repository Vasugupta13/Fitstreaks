import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:fitstreaks/features/exercises/controller/exercise_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiActivityWidget extends StatelessWidget {
  const BmiActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ExerciseController exerciseController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors.kGreyColor.withOpacity(0.6), blurRadius: 15)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircularSeekBar(
                          trackColor: AppColors.kLightGreyColor,
                          width: double.infinity,
                          height: 140,
                          maxProgress: 40,
                          progress: exerciseController.bmi.value,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ReusableText(
                                text: "BMI",
                                size: 10,
                              ),
                              ReusableText(
                                text: exerciseController.bmi.toStringAsFixed(2),
                                size: 22,
                                fontWeight: FontWeight.w600,
                                color: exerciseController.bmiStatus.value ==
                                        "Underweight"
                                    ? AppColors.kYellowColor
                                    : exerciseController.bmiStatus.value ==
                                            "Normal"
                                        ? AppColors.kGreenColor
                                        : AppColors.kRedAccent,
                              ),
                              ReusableText(
                                text: exerciseController.bmiStatus.value,
                                size: 13,
                              )
                            ],
                          ),
                        )
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
                          maxProgress: 2,
                          progress: exerciseController.activityLevel.value,
                          barWidth: 8,
                          startAngle: 45,
                          sweepAngle: 270,
                          strokeCap: StrokeCap.round,
                          progressGradientColors: const [
                            Colors.yellow,
                            AppColors.kGreenColor,
                            AppColors.kOrangeColor,
                            AppColors.kRedAccent
                          ],
                          dashWidth: 55.5,
                          dashGap: 16,
                          animation: true,
                          interactive: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ReusableText(
                                text: "Activity Level",
                                size: 10,
                              ),
                              ReusableText(
                                text: exerciseController.activityLevel.value
                                    .toStringAsFixed(3),
                                size: 22,
                                fontWeight: FontWeight.w600,
                                color: exerciseController
                                            .activityLevelName.value ==
                                        "Sedentary"
                                    ? AppColors.kRedAccent
                                    : exerciseController
                                                .activityLevelName.value ==
                                            "Light"
                                        ? AppColors.kOrangeColor
                                        : exerciseController
                                                    .activityLevelName.value ==
                                                "Moderate"
                                            ? AppColors.kYellowColor
                                            : AppColors.kGreenColor,
                              ),
                              ReusableText(
                                text:
                                    exerciseController.activityLevelName.value,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ReusableText(
                  text:
                      "You have ${exerciseController.bmiStatus.value} BMI and ${exerciseController.activityLevel.value} Activity level.",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ReusableText(
                  text: "We have curated best exercises for you.",
                  color: AppColors.kGreyColor.withOpacity(0.7),
                  size: 13,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
