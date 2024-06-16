import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SelectPersonType extends StatefulWidget {
  const SelectPersonType({super.key});

  @override
  State<SelectPersonType> createState() => _SelectPersonTypeState();
}

class _SelectPersonTypeState extends State<SelectPersonType> {
  FormController formController = Get.put(FormController());
  String userName = '';
  String selectedChoice = '';
  @override
  void initState() {
    userName = FirebaseAuth.instance.currentUser!.displayName ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.kBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Welcome! $userName ❤️",
                      size: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    const ReusableText(
                      text: "Please answers few question about you.",
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
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
                      text: "Are you physically Challenged?",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text: "This will help us curate best plans.",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGreyColor,
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    formController.selectChoice('Yes');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.kWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: AppColors.kLightGreyColor,
                            offset: const Offset(0, 0),
                          )
                        ],
                        border: Border.all(
                            color: formController.selectedChoice.value == "Yes"
                                ? AppColors.kBlueColor
                                : Colors.grey)),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          text: "Yes",
                          size: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kBlackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    formController.selectChoice('No');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.kWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: AppColors.kLightGreyColor,
                            offset: const Offset(0, 0),
                          )
                        ],
                        border: Border.all(
                            color: formController.selectedChoice.value == "No"
                                ? AppColors.kBlueColor
                                : Colors.grey)),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          text: "No",
                          size: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kBlackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(flex: 4, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () {
                  formController.setDisabledOrNot(
                      formController.selectedChoice.value == "Yes"
                          ? true
                          : false);
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
