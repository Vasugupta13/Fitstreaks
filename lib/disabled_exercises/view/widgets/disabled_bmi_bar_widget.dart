import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:fitstreaks/disabled_exercises/controller/disability_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisabledBmiCardWidget extends StatelessWidget {
  const DisabledBmiCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DisabilityController disabilityController = Get.find();
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
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Expanded(
                    child: Column(
                        crossAxisAlignment :CrossAxisAlignment.start,
                      children: [
                        const ReusableText(text: "Level",size: 10,fontWeight: FontWeight.w700,color: AppColors.kYellowColor,),
                        const ReusableText(text: "Normal 📈",size: 20,fontWeight: FontWeight.w600,color: AppColors.kDarkBg,),
                        const ReusableText(text: "Cals",size: 10,fontWeight: FontWeight.w700,color: AppColors.kYellowColor,),
                        ReusableText(text: "${disabilityController.cals} 🔥",size: 20,fontWeight: FontWeight.w600,color: AppColors.kDarkBg,),
                        const ReusableText(text: "Duration",size: 10,fontWeight: FontWeight.w700,color: AppColors.kYellowColor,),
                        ReusableText(text: "${disabilityController.duration} ⏳",size: 20,fontWeight: FontWeight.w600,color: AppColors.kDarkBg,),
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
                          progress: disabilityController.bmi.value,
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
                                text: disabilityController.bmi.toStringAsFixed(2),
                                size: 22,
                                fontWeight: FontWeight.w600,
                                color: disabilityController.bmiStatus.value ==
                                    "Underweight"
                                    ? AppColors.kYellowColor
                                    : disabilityController.bmiStatus.value ==
                                    "Normal"
                                    ? AppColors.kGreenColor
                                    : AppColors.kRedAccent,
                              ),
                              ReusableText(
                                text: disabilityController.bmiStatus.value,
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
                text:
                "You have ${disabilityController.bmiStatus.value} BMI.",
              ),
              ReusableText(
                text: "We have curated best exercises for you.",
                color: AppColors.kGreyColor.withOpacity(0.7),
                size: 13,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
    );
  }
}