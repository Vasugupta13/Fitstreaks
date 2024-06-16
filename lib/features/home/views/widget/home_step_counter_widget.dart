import 'package:fitstreaks/controller/pedometer_controller.dart';
import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepCounterWidget extends StatelessWidget {
  const StepCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    PedometerController pedometerController = Get.find();
    homeController.showCurrentSteps();
    double autoScale = Get.width / 400;
    return  Obx(()=>
        Container(
          width: Get.width,
          padding:
          EdgeInsets.fromLTRB(20 * autoScale, 20* autoScale, 30* autoScale, 20* autoScale),
          decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius:
              const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 12,
                    color: AppColors.kLightGreyColor,
                    offset: const Offset(2, 2))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: "Goal",size: 18* autoScale,fontWeight: FontWeight.w600,),
                    ReusableText(text: pedometerController.goal.toString(),size: 35* autoScale,fontWeight: FontWeight.w600,color: AppColors.kGreenColor,height: 1,),
                    ReusableText(text: "steps",size: 12* autoScale,fontWeight: FontWeight.w500,),
                    SizedBox(height: 20* autoScale,),
                    ReusableText(text: "You have reached",size: 13* autoScale,fontWeight: FontWeight.w500,color: AppColors.kGreyColor,),
                    ReusableText(text: "${((homeController.steps.value/pedometerController.goal) * 100).toStringAsFixed(1)}%",size: 18* autoScale,fontWeight: FontWeight.w500,color: AppColors.kBlueColor,),
                    ReusableText(text: "of your goal.",size: 13* autoScale,fontWeight: FontWeight.w500,color: AppColors.kGreyColor,),
                  ],),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  radius: 90,
                  lineWidth: 10.0,
                  animation: true,
                  percent: homeController.steps.value/pedometerController.goal,
                  backgroundColor: AppColors.kLightGreyColor,
                  center: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconAssets.kSteps,color: AppColors.kBlueColor,height: 30,),
                      ReusableText(
                          text: homeController.steps.value.toString(),
                          fontWeight: FontWeight.w500, size: 45.0),
                      const ReusableText(
                          text:  "Steps taken",
                          fontWeight: FontWeight.w500, size: 15.0),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.kBlueColor,
                ),
              ),
            ],
          ),
        ));
  }
}
