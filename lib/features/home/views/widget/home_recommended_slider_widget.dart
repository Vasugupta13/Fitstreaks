import 'package:card_swiper/card_swiper.dart';
import 'package:fitstreaks/features/diet_plan/view/diet_plan_view.dart';
import 'package:fitstreaks/features/exercises/view/exercises_view.dart';
import 'package:fitstreaks/features/stretching/view/stretching_view.dart';
import 'package:fitstreaks/features/zumba/view/zumba_view.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeRecommendedPlanWidget extends StatelessWidget {
  const HomeRecommendedPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Get.height * 0.43,
        width: Get.width,
        child: Swiper(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                index == 0
                  ? Get.to(const ExercisesView())
                  : index == 1
                  ? Get.to(const DietPlanView())
                  : index == 2
                  ? Get.to(const ZumbaView())
                  : Get.to(const StretchingView());},
              child: Center(
                child: SizedBox(
                  height: Get.height * 0.42,
                  width: Get.width * 0.7,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.42,
                        width: Get.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight, // or Alignment.topLeft
                            colors: [
                              index == 0
                                  ? AppColors.kYellowColor
                                  : index == 1
                                      ? AppColors.kGreenColor
                                      : index == 2
                                          ? AppColors.kSkyBlueColor
                                          : AppColors.kOrangeColor,
                              index == 0
                                  ? AppColors.kLightYellowColor
                                  : index == 1
                                      ? AppColors.kLightGreenColor
                                      : index == 2
                                          ? AppColors.kLightSkyBlueColor
                                          : AppColors.kLightOrangeColor,
                              index == 0
                                  ? AppColors.kYellowColor
                                  : index == 1
                                      ? AppColors.kGreenColor
                                      : index == 2
                                          ? AppColors.kSkyBlueColor
                                          : AppColors.kOrangeColor,
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            index == 0
                                ? ImageAssets.kExerciseImage
                                : index == 1
                                    ? ImageAssets.kDietPlateImage
                                    : index == 2
                                        ? ImageAssets.kZumbaImage
                                        : ImageAssets.kStretchingImage,
                            height: Get.height * 0.38,
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: Get.height * 0.42,
                          width: Get.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter, // or Alignment.topLeft
                              colors: [
                                AppColors.kYellowColor.withOpacity(0),
                                AppColors.kYellowColor.withOpacity(0),
                                AppColors.kYellowColor.withOpacity(0),
                                index == 0
                                    ? AppColors.kYellowColor.withOpacity(0)
                                    : index == 1
                                        ? AppColors.kGreenColor.withOpacity(0)
                                        : index == 2
                                            ? AppColors.kSkyBlueColor
                                                .withOpacity(0)
                                            : AppColors.kOrangeColor
                                                .withOpacity(0),
                                index == 0
                                    ? AppColors.kYellowColor
                                    : index == 1
                                        ? AppColors.kGreenColor
                                        : index == 2
                                            ? AppColors.kSkyBlueColor
                                            : AppColors.kOrangeColor,
                                index == 0
                                    ? AppColors.kYellowColor
                                    : index == 1
                                        ? AppColors.kGreenColor
                                        : index == 2
                                            ? AppColors.kSkyBlueColor
                                            : AppColors.kOrangeColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, bottom: 40),
                            child: Text(
                              index == 0
                                  ? "Exercises"
                                  : index == 1
                                      ? "Diet"
                                      : index == 2
                                          ? "Zumba"
                                          : "Stretching",
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
            );
          },
          viewportFraction: 0.7,
          scale: 0.8,
        ),
      ),
    );
  }
}
