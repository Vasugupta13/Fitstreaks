import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_previous_experience.dart';
import 'package:fitstreaks/features/form/views/widgets/selection_tile%20widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisabledTypeSelection extends StatefulWidget {
  const DisabledTypeSelection({super.key});

  @override
  State<DisabledTypeSelection> createState() =>
      _DisabledTypeSelectionState();
}

class _DisabledTypeSelectionState
    extends State<DisabledTypeSelection> {
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
            const Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ReusableText(
                      text: "What's your type of Disability?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedDisabilityType.value == "Locomotor"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Locomotor Disability",
                onTap: () {
                  formController.selectDisabilityType('Locomotor');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedDisabilityType.value == "Amputee"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Amputee",
                title2: "(no hands)",
                onTap: () {
                  formController.selectDisabilityType('Amputee');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedDisabilityType.value == "Deaf"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Deaf",
                onTap: () {
                  formController.selectDisabilityType('Deaf');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedDisabilityType.value == "Dumb"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Dumb",
                onTap: () {
                  formController.selectDisabilityType('Dumb');
                },
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () {
                  if(formController.selectedMotivation.value.isEmpty){
                    SnackBarService.showSnackBar(context: context, message: "Please select any.", backgroundColor: AppColors.kRedAccent);
                    return;
                  }
                  formController.changeFormProgress(
                    title: "selectedTypeOfDisability" ,
                    value: true,
                  );
                  formController
                      .changeUserDetails(title: "selectedTypeOfDisability",
                      value:
                      formController.selectedDisabilityType.value)
                      .whenComplete(() =>
                      Get.to(() => const DisabledPreviousExp()));
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
