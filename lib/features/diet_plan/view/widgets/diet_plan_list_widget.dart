import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/features/diet_plan/view/nutritional_req_view.dart';
import 'package:fitstreaks/features/diet_plan/view/weight_gain_plan_view.dart';
import 'package:fitstreaks/features/diet_plan/view/widgets/weight_loss_plan_view.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DietPlanListWidget extends StatelessWidget {
  const DietPlanListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * autoScale, vertical: 10 * autoScale),
      child: GridView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                index == 0
                    ? Get.to(() => const WeightLossPlanView())
                    : index == 1
                        ? Get.to(() => const WeightGainPlanView())
                        : Get.to(() => const NutritionalReqView());
              },
              child: SizedBox(
                width: 230,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              index == 0
                                  ? AppColors.kPurpleColor
                                  : index == 1
                                      ? AppColors.kYellowColor
                                      : AppColors.kPinkColor,
                              index == 0
                                  ? AppColors.kLightPurpleColor
                                  : index == 1
                                      ? AppColors.kLightYellowColor
                                      : AppColors.kLightPinkColor,
                              index == 0
                                  ? AppColors.kPurpleColor
                                  : index == 1
                                      ? AppColors.kYellowColor
                                      : AppColors.kPinkColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: AppColors.kGreyColor.withOpacity(0.4),
                            )
                          ]),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: recommendedPlans[index]['image'],
                          imageBuilder: (context, provider) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20 * autoScale),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: provider,
                                        fit: BoxFit.fitHeight)),
                              ),
                            );
                          },
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            color: AppColors.kOrangeColor,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              index == 0
                                  ? AppColors.kLightPurpleColor.withOpacity(0)
                                  : index == 1
                                      ? AppColors.kLightGreenishBlueColor
                                          .withOpacity(0)
                                      : AppColors.kLightPinkColor
                                          .withOpacity(0),
                              index == 0
                                  ? AppColors.kLightPurpleColor.withOpacity(0)
                                  : index == 1
                                      ? AppColors.kLightGreenishBlueColor
                                          .withOpacity(0)
                                      : AppColors.kLightPinkColor
                                          .withOpacity(0),
                              index == 0
                                  ? AppColors.kLightPurpleColor.withOpacity(0)
                                  : index == 1
                                      ? AppColors.kLightYellowColor
                                          .withOpacity(0)
                                      : AppColors.kLightPinkColor
                                          .withOpacity(0),
                              index == 0
                                  ? AppColors.kPurpleColor
                                  : index == 1
                                      ? AppColors.kYellowColor
                                      : AppColors.kPinkColor,
                              index == 0
                                  ? AppColors.kPurpleColor
                                  : index == 1
                                      ? AppColors.kYellowColor
                                      : AppColors.kPinkColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 5, right: 35),
                        child: Text(
                          recommendedPlans[index]['name'],
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kWhiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
