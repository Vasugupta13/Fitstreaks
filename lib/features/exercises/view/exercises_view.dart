import 'package:fitstreaks/features/exercises/controller/exercise_controller.dart';
import 'package:fitstreaks/features/exercises/view/widgets/exercise_list_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/bmi_activity_bar_widget.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    ExerciseController exerciseController = Get.put(ExerciseController());
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Exercises",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
          () =>
          !exerciseController.isLoading.value ?
          ListView(
            children: const [
              SizedBox(height: 30,),
              BmiActivityWidget(),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableText(
                        text: "Recommended Exercises",
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              ExerciseListWidget(),
            ],
          ) :  const Center(
            child: CircularProgressIndicator(
              color: AppColors.kYellowColor,
            ),
          ),
      ),
    );
  }
}
