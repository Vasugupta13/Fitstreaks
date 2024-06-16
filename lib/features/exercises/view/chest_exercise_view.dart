import 'package:fitstreaks/features/exercises/controller/exercise_controller.dart';
import 'package:fitstreaks/features/exercises/view/widgets/exercise_list_common_widget.dart';
import 'package:fitstreaks/features/stretching/view/widgets/top_info_card_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChestExerciseView extends StatelessWidget {
  const ChestExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    ExerciseController exerciseController = Get.find();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Exercises",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            ExerciseTopInfoCardWidget(
              time: exerciseController.chestDuration.value,
              description: allExercise[2]["description"],
              level: exerciseController.levelName.value == "Intermediate"
                  ? "Medium"
                  : exerciseController.levelName.value,
              cals: exerciseController.chestCalories.value,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15 * autoScale,
              ),
              child: Row(
                children: [
                  ReusableText(
                    text: "Chest workout",
                    color: AppColors.kYellowColor,
                    fontWeight: FontWeight.w600,
                    size: 20 * autoScale,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: exerciseController.chestList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ExerciseListCommonWidget(
                  image: exerciseController.chestList[index].image,
                  name: exerciseController.chestList[index].name,
                  index: index,
                  list: exerciseController.chestList,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
