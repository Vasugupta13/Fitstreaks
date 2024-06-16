
import 'package:fitstreaks/features/diet_plan/controller/diet_controller.dart';
import 'package:fitstreaks/features/diet_plan/view/diet_plan_view.dart';
import 'package:fitstreaks/disabled_exercises/view/disabled_view.dart';
import 'package:fitstreaks/features/exercises/view/exercises_view.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../diet_plan/view/widgets/diet_plan_suggestion_widget.dart';

class DisabledHomeView extends StatelessWidget {
  final String disabilityType;
  const DisabledHomeView({super.key, required this.disabilityType});

  @override
  Widget build(BuildContext context) {
    Get.put(DietController());
    return SingleChildScrollView(
      child: Column(
        children: [
          const DietPlanSuggestionWidget(),
          GestureDetector(
            onTap: (){Get.to(const DietPlanView());},
            child: SizedBox(
              height: Get.height * 0.42,
              width: Get.width * 0.9 ,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: Get.height * 0.42,
                      width: Get.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kGreyColor.withOpacity(0.5),
                            blurRadius: 5
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight, // or Alignment.topLeft
                          colors: [
                            AppColors.kGreenColor,
                            AppColors.kLightGreenColor,
                            AppColors.kLightGreenColor,
                            AppColors.kGreenColor,
                            AppColors.kGreenColor,
                            AppColors.kLightGreenColor,
                            AppColors.kLightGreenColor,
                            AppColors.kGreenColor,
                            AppColors.kGreenColor,
                            AppColors.kGreenColor,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          ImageAssets.kDietPlateImage,
                          height: Get.height * 0.34,
                        )),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 70, bottom: 40),
                        child: Text(
                          "Diet",
                          style: GoogleFonts.openSans(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: AppColors.kWhiteColor),
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 15),
                        child: Text(
                          "Best recommended\nfor you.",
                          style: GoogleFonts.notoSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.kWhiteColor,
                              height: 1),
                        ),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){Get.to( DisabledExercise(disabilityType: disabilityType));},
            child: SizedBox(
              height: Get.height * 0.42,
              width: Get.width * 0.9 ,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: Get.height * 0.42,
                      width: Get.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.kGreyColor.withOpacity(0.5),
                              blurRadius: 5
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight, // or Alignment.topLeft
                          colors: [
                            AppColors.kYellowColor,
                            AppColors.kLightYellowColor,
                            AppColors.kYellowColor,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 40),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          ImageAssets.kExerciseImage,
                          height: Get.height * 0.43,
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 40),
                        child: Text(
                          "Exercises",
                          style: GoogleFonts.openSans(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: AppColors.kWhiteColor),
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          "Best recommended\nfor you.",
                          style: GoogleFonts.notoSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.kWhiteColor,
                              height: 1),
                        ),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
