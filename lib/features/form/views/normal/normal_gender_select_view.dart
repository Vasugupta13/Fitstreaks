import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/normal/normal_motivation_select_view.dart';
import 'package:fitstreaks/features/form/views/widgets/selection_tile%20widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalGenderSelectView extends StatefulWidget {
  const NormalGenderSelectView({super.key});

  @override
  State<NormalGenderSelectView> createState() => _NormalGenderSelectViewState();
}

class _NormalGenderSelectViewState extends State<NormalGenderSelectView> {
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
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: ReusableText(
                      text: "What's your gender?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text: "Help us to know you better",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGreyColor,
                  ),
                ],
              ),
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor: formController.selectedGender.value == "Male"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Male",
                onTap: () {
                  formController.selectGender('Male');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor: formController.selectedGender.value == "Female"
                    ? AppColors.kBlueColor
                    : Colors.grey,
                title: "Female",
                onTap: () {
                  formController.selectGender('Female');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SelectionTileWidget(
                borderColor:
                    formController.selectedGender.value == "Rather not say"
                        ? AppColors.kBlueColor
                        : Colors.grey,
                title: "Rather not say",
                onTap: () {
                  formController.selectGender('Rather not say');
                },
              ),
            ),
            const Expanded(flex: 4, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () {
                  if(formController.selectedGender.value.isEmpty){
                    SnackBarService.showSnackBar(context: context, message: "Please select your gender", backgroundColor: AppColors.kRedAccent);
                    return;
                  }
                  formController.changeFormProgress(
                    title: "selectedGender" ,
                    value: true,
                  );
                  formController.changeUserDetails(title: 'selectedGender',
                      value: formController.selectedGender.value).whenComplete(() =>
                  Get.to(() => const NormalMotivationSelection()));
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
