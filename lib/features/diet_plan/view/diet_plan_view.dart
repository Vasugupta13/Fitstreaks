import 'package:fitstreaks/features/diet_plan/controller/diet_controller.dart';
import 'package:fitstreaks/features/diet_plan/view/widgets/diet_plan_suggestion_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/diet_plan_list_widget.dart';

class DietPlanView extends StatelessWidget {
  const DietPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    DietController dietController = Get.put(DietController());
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        title: ReusableText(
          text: "Diet plan",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
        surfaceTintColor: AppColors.kWhiteColor,
      ),
      body: ListView(
        children: [
          Obx(
            () => !dietController.loading.value
                ? const Column(children: [
                    DietPlanSuggestionWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableText(
                              text: "Recommended Diet plans",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DietPlanListWidget(),
                  ])
                : Column(
                  children: [
                    SizedBox(height: Get.height * 0.4,),
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kGreenColor,
                      ),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
