import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_type_view.dart';
import 'package:fitstreaks/features/form/views/widgets/selection_tile%20widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisabledMotivationSelection extends StatefulWidget {
  const DisabledMotivationSelection({super.key});

  @override
  State<DisabledMotivationSelection> createState() =>
      _DisabledMotivationSelectionState();
}

class _DisabledMotivationSelectionState
    extends State<DisabledMotivationSelection> {
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
                      text: "What's motivates you the most?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text: "Tell us the source of you motivation",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGreyColor,
                  ),
                ],
              ),
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor: formController.selectedMotivation.value ==
                        "👊  Feel Confident"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "👊  Feel Confident",
                onTap: () {
                  formController.selectedMotivation('👊  Feel Confident');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor: formController.selectedMotivation.value ==
                        "🎈  Release stress"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "🎈  Release stress",
                onTap: () {
                  formController.selectedMotivation('🎈  Release stress');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor: formController.selectedMotivation.value ==
                        "💪 Improve health"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "💪 Improve health",
                onTap: () {
                  formController.selectedMotivation('💪 Improve health');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor: formController.selectedMotivation.value ==
                        "️‍🔥  Boost energy"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "️‍🔥  Boost energy",
                onTap: () {
                  formController.selectedMotivation('️‍🔥  Boost energy');
                },
              ),
            ),
            const Expanded(flex: 3, child: SizedBox()),
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
                    title: "selectedMotivation" ,
                    value: true,
                  );
                  formController
                      .changeUserDetails(
                      title: "selectedActivityLevel",
                      value: "1.2");
                  formController
                      .changeUserDetails(
                          title: "selectedMotivation",
                          value: formController.selectedMotivation.value)
                      .whenComplete(() =>
                          Get.to(() => const DisabledTypeSelection()));
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
