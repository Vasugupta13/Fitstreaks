import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_motivation_select.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_workout_days_selection_view.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/selection_tile widget.dart';

class DisabledPreviousExp extends StatefulWidget {
  const DisabledPreviousExp({super.key});

  @override
  State<DisabledPreviousExp> createState() =>
      _DisabledPreviousExpState();
}

class _DisabledPreviousExpState extends State<DisabledPreviousExp> {
  @override
  Widget build(BuildContext context) {
    FormController formController = Get.put(FormController());
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.kBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: ReusableText(
                      text: "Do you have any experience with such apps?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedPreviousExp.value == "Yes"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Yes",
                onTap: () {
                  formController.selectedPreviousExp('Yes');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedPreviousExp.value == "No"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "No",
                onTap: () {
                  formController.selectedPreviousExp('No');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedPreviousExp.value == "No, but I am aware"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "No, but I am aware",
                onTap: () {
                  formController.selectedPreviousExp('No, but I am aware');
                },
              ),
            ),
            const Expanded(flex: 4, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () {
                  if(formController.selectedPreviousExp.value.isEmpty){
                    SnackBarService.showSnackBar(context: context, message: "Please select any.", backgroundColor: AppColors.kRedAccent);
                    return;
                  }
                  formController.changeFormProgress(
                    title: "selectedPreviousWorkout" ,
                    value: true,
                  );
                  formController
                      .changeUserDetails(
                      title: "selectedPreviousWorkout",
                      value: formController.selectedPreviousExp.value)
                      .whenComplete(() =>
                      Get.to(() => const DisabledWorkoutDaysSelection()));
                },
                borderWidth: 1,
                weight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
