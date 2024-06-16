import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/features/exercises/controller/exercise_controller.dart';
import 'package:fitstreaks/features/exercises/view/widgets/exercise_details_common_widget.dart';
import 'package:fitstreaks/model/exercise_model.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExerciseListCommonWidget extends StatelessWidget {
  final String image;
  final String name;
  final int index;
  final List<Exercise> list;
  const ExerciseListCommonWidget({
    super.key,
    required this.image,
    required this.name,
    required this.index,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return GestureDetector(
      onTap: () {
        Get.to(() => ExerciseDetailCommonWidget(
              duration: list[index].duration,
              image: list[index].image,
              reps: list[index].repetitions,
              description: list[index].description,
              title: list[index].name,
            ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 * autoScale),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    height: 60,
                    imageBuilder: (context, provider) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: provider,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        SizedBox(
                            height: Get.height * 0.37,
                            child: Center(
                                child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColors.kYellowColor,
                            ))),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 10 * autoScale,),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableText(
                          text: name,
                          fontWeight: FontWeight.w500,
                          size: 16 * autoScale,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    CupertinoIcons.forward,
                    size: 18 * autoScale,
                    color: AppColors.kYellowColor,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10 * autoScale),
              child: const Divider(
                color: AppColors.kYellowColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
