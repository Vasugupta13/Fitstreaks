import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/normal/normal_physical_aspect_view.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalWorkoutDaysSelection extends StatefulWidget {
  const NormalWorkoutDaysSelection({super.key});

  @override
  State<NormalWorkoutDaysSelection> createState() =>
      _NormalWorkoutDaysSelectionState();
}

class _NormalWorkoutDaysSelectionState
    extends State<NormalWorkoutDaysSelection> {
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
                      text: "Set your weekly goal",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text:
                        "We recommend training at least 3 days a week for a better results.",
                    size: 14,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGreyColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  const ReusableText(
                    text: "🎯 Weekly training days",
                    size: 15,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kBlackColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 4.0, // space between rows
                      children: targetDaysList
                          .map(
                            (day) => GestureDetector(
                              onTap: () {
                                formController.selectWorkoutDays(day);
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: formController
                                                  .selectedWorkoutDays.value ==
                                              day
                                          ? Colors.transparent
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: formController
                                                .selectedWorkoutDays.value ==
                                            day
                                        ? AppColors.kBlueColor
                                        : AppColors.kWhiteColor),
                                duration: const Duration(milliseconds: 300),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  child: FittedBox(
                                    child: Center(
                                      child: Text(
                                        day.toString(),
                                        style: GoogleFonts.albertSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: formController
                                                        .selectedWorkoutDays
                                                        .value ==
                                                    day
                                                ? AppColors.kWhiteColor
                                                : AppColors.kBlackColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () {
                  formController.changeFormProgress(
                    title: "selectedWorkoutDays",
                    value: true,
                  );
                  formController
                      .changeUserDetails(
                          title: "selectedWorkoutDays",
                          value: formController.selectedWorkoutDays.value
                              .toString())
                      .whenComplete(
                          () => Get.to(() => const NormalPhysicalAspectView()));
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
