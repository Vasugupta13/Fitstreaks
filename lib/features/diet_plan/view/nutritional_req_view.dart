import 'package:fitstreaks/features/diet_plan/controller/diet_controller.dart';
import 'package:fitstreaks/features/diet_plan/view/widgets/fb_nutritional_card.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionalReqView extends StatelessWidget {
  const NutritionalReqView({super.key});

  @override
  Widget build(BuildContext context) {
    DietController dietController = Get.find();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Nutritional Needs",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => !dietController.loading.value
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    FBDNutritionCard(
                        color: AppColors.kPinkColor,
                        title: "Here's your nutritional requirements",
                        data: dietController.forAdultPlan!.value == null &&
                                dietController.olderAgedPlan!.value == null &&
                                dietController.middleAgedPlan!.value == null
                            ? dietController.teenPlan!.value!.toMap()
                            : dietController.forAdultPlan!.value == null &&
                                    dietController.teenPlan!.value == null &&
                                    dietController.middleAgedPlan!.value == null
                                ? dietController.olderAgedPlan!.value!.toMap()
                                : dietController.forAdultPlan!.value == null &&
                                        dietController.teenPlan!.value ==
                                            null &&
                                        dietController.olderAgedPlan!.value ==
                                            null
                                    ? dietController.middleAgedPlan!.value!
                                        .toMap()
                                    : dietController.forAdultPlan!.value!
                                        .toMap()),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ReusableText(
                        text: "Other additional needs according to conditions",
                        size: 23,
                        color: AppColors.kDarkBg,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FBDNutritionCard(
                        color: AppColors.kGreenColor,
                        title: "Based on specific health conditions",
                        data: dietController.specificCondition!.value!.toMap()),
                    !dietController.isMale.value
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    ReusableText(
                                      text: "Since you are a Woman 🙋‍♀️",
                                      size: 23,
                                      color: AppColors.kDarkBg,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FBDNutritionCard(
                                  color: AppColors.kYellowColor,
                                  title: "For period of menopause",
                                  data: dietController.menopausalPlan!.value!
                                      .toMap()),
                              const SizedBox(
                                height: 20,
                              ),
                              FBDNutritionCard(
                                  color: AppColors.kBlueColor.withOpacity(0.8),
                                  title: "Only for pregnant women 🤰",
                                  data: dietController.menopausalPlan!.value!
                                      .toMap()),
                            ],
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPinkColor,
                ),
              ),
      ),
    );
  }
}
