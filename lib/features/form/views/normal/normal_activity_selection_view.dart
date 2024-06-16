import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/normal/normal_workout_days_selection_view.dart';
import 'package:fitstreaks/features/form/views/widgets/selection_tile%20widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalActivitySelectionView extends StatefulWidget {
  const NormalActivitySelectionView({super.key});

  @override
  State<NormalActivitySelectionView> createState() => _NormalActivitySelectionViewState();
}

class _NormalActivitySelectionViewState extends State<NormalActivitySelectionView> {
  FormController formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    FormController formController = Get.put(FormController());
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.kBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: ReusableText(
                      text: "What's your activity level?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text: "Tell us about your activity level on average days.",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGreyColor,
                  ),
                ],
              ),
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedActivityLevel.value == "1.2"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "‍🧑‍💻  Sedentary",
                onTap: () {
                  formController.selectActivityLevel('1.2');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedActivityLevel.value == "1.375"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "🚶  Lightly active",
                onTap: () {
                  formController.selectActivityLevel('1.375');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                    borderColor: formController.selectedActivityLevel.value == "1.55"
                        ? AppColors.kBlueColor
                        : Colors.grey,
                    title: "🏃‍♂️  Moderately active",
                    onTap: () {
                      formController.selectActivityLevel('1.55');
                    },
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                    borderColor: formController.selectedActivityLevel.value == "1.725"
                        ? AppColors.kBlueColor
                        : Colors.grey,
                    title: "🏂  Very active",
                    onTap: () {
                      formController.selectActivityLevel('1.725');
                    },
                  ),
            ),
            const Expanded(
                flex: 4,
                child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(text: 'Next',onPressed: (){
                if(formController.selectedActivityLevel.value.isEmpty){
                  SnackBarService.showSnackBar(context: context, message: "Please select any.", backgroundColor: AppColors.kRedAccent);
                  return;
                }
                formController.changeFormProgress(
                  title: "selectedActivityLevel" ,
                  value: true,
                );
                formController.changeUserDetails(title: 'selectedActivityLevel',
                    value: formController.selectedActivityLevel.value).whenComplete(() =>
                    Get.to(() => const NormalWorkoutDaysSelection()));
              },borderWidth: 1,weight: FontWeight.w500,),
            )
          ],
        ),
      ),
    );
  }
}
