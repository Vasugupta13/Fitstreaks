import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/normal/normal_activity_selection_view.dart';
import 'package:fitstreaks/features/form/views/widgets/selection_tile%20widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalPushUpSelectionView extends StatefulWidget {
  const NormalPushUpSelectionView({super.key});

  @override
  State<NormalPushUpSelectionView> createState() => _NormalPushUpSelectionViewState();
}

class _NormalPushUpSelectionViewState extends State<NormalPushUpSelectionView> {
  FormController formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
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
                      text: "How many pus-ups can you do at one time?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
                  () => SelectionTileWidget(
                borderColor: formController.selectedPushUpLevel.value == "Amateur"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "👆 Amateur",
                title2: '(3 to 5)',
                onTap: () {
                  formController.selectPushUpLevel('Amateur');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                    borderColor: formController.selectedPushUpLevel.value == "Intermediate"
                        ? AppColors.kBlueColor
                        : Colors.grey,
                    title: "✌️ Intermediate",
                    title2: '(5 to 10)',
                    onTap: () {
                      formController.selectPushUpLevel('Intermediate');
                    },
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
                  () => SelectionTileWidget(
                    borderColor: formController.selectedPushUpLevel.value == "Advanced"
                        ? AppColors.kBlueColor
                        : Colors.grey,
                    title: "👍 Advanced",
                    title2: '(More than 10)',
                    onTap: () {
                      formController.selectPushUpLevel('Advanced');
                    },
                  ),
            ),
            const Expanded(flex: 4, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () {
                  if(formController.selectedPushUpLevel.value.isEmpty){
                    SnackBarService.showSnackBar(context: context, message: "Please select one level", backgroundColor: AppColors.kRedAccent);
                    return;
                  }
                  formController.changeFormProgress(
                    title: "selectedPushUpLevel" ,
                    value: true,
                  );
                  formController.changeUserDetails(title: 'selectedPushUpLevel',
                      value: formController.selectedPushUpLevel.value).whenComplete(() =>
                      Get.to(() => const NormalActivitySelectionView()));
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
