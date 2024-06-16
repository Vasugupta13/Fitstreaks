import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/features/home/views/widget/home_recommended_slider_widget.dart';
import 'package:fitstreaks/features/home/views/widget/home_step_counter_widget.dart';
import 'package:fitstreaks/features/home/views/widget/this_week_step_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalHomeView extends StatelessWidget {
  const NormalHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    double autoScale = Get.width / 400;
    return Obx(() =>
    !homeController.isLoading.value?  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10* autoScale, horizontal: 20* autoScale),
              child: const Column(
                children: [
                  StepCounterWidget(),
                  ThisWeekWidget(),
                  Row(
                    children: [
                      ReusableText(
                          text:  "Recommended Plans",
                          fontWeight: FontWeight.w500, size: 18.0),
                    ],
                  ),
                ],
              ),
            ),
            const HomeRecommendedPlanWidget(),
          ],
        ),
      ) : const Center(child: CircularProgressIndicator(color: AppColors.kSkyBlueColor,),),
    );
  }
}
