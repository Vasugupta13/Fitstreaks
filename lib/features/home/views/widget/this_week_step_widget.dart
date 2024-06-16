import 'package:fitstreaks/controller/pedometer_controller.dart';
import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ThisWeekWidget extends StatelessWidget {
  const ThisWeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    PedometerController pedometerController = Get.find();
    double autoScale = Get.width / 400;
    return Column(children: [
      const SizedBox(height: 20,),
      const Row(
        children: [
          ReusableText(
              text:  "This week",
              fontWeight: FontWeight.w500, size: 18.0),
        ],
      ),
      const SizedBox(height: 5,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.monday/pedometerController.goal,"M"),
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.tuesday/pedometerController.goal,"T"),
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.wednesday/pedometerController.goal,"w"),
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.thursday/pedometerController.goal,"Th"),
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.friday/pedometerController.goal,"F"),
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.saturday/pedometerController.goal,"Sa"),
          _buildCircularIndicator(autoScale,homeController.stepDetails.value.sunday/pedometerController.goal,"S"),
        ],
      ),
      const SizedBox(height: 20,),
    ],);
  }
  Widget _buildCircularIndicator(double autoScale,double percentage,String title){
    return CircularPercentIndicator(
      radius: 21 * autoScale,
      lineWidth: 5.0,
      animation: true,
      percent: percentage,
      center: ReusableText(text: title,size: 12,),
      backgroundColor: AppColors.kLightGreyColor,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.kGreenColor,
    );
  }
}
