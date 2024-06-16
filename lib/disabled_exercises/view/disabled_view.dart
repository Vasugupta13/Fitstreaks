import 'package:fitstreaks/disabled_exercises/view/widgets/disabled_bmi_bar_widget.dart';
import 'package:fitstreaks/disabled_exercises/controller/disability_controller.dart';
import 'package:fitstreaks/disabled_exercises/view/widgets/disabled_list_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisabledExercise extends StatefulWidget {
  final String disabilityType;
  const DisabledExercise({super.key, required this.disabilityType});

  @override
  State<DisabledExercise> createState() => _DisabledExerciseState();
}

class _DisabledExerciseState extends State<DisabledExercise> {
  DisabilityController disabilityController = Get.put(DisabilityController());
  @override
  void initState() {
    disabilityController.init(widget.disabilityType);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        !disabilityController.isLoading.value ?
        ListView(
          children: [
            const SizedBox(height: 30,),
            const DisabledBmiCardWidget(),
            const SizedBox(height: 20,),
            const Padding(
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
            DisabilityListWidget(list: disabilityController.exerciseList,),
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
