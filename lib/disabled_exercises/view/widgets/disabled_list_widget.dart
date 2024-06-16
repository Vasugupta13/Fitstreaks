import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/disabled_exercises/view/widgets/disabled_exercise_detail_widget.dart';
import 'package:fitstreaks/model/exercise_model.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DisabilityListWidget extends StatelessWidget {
  final List<Exercise> list;
  const DisabilityListWidget({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * autoScale, vertical: 10 * autoScale),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => DisabledExerciseDetailWidget(
                  duration: list[index].duration,
                  image: list[index].image,
                  cals: list[index].cals,
                  description: list[index].description,
                  title: list[index].name,
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl: list[index].image,
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
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => SizedBox(
                                height: Get.height * 0.37,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: AppColors.kOrangeColor,
                                ))),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      width: 20 * autoScale,
                    ),
                    Expanded(
                      flex: 6,
                      child: ReusableText(
                        text: list[index].name,
                        fontWeight: FontWeight.w500,
                        size: 16 * autoScale,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
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
          );
        },
      ),
    );
  }
}
