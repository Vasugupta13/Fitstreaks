import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/widgets/fb_stretching.dart';
import 'package:fitstreaks/features/stretching/view/widgets/top_info_card_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullBodyStretchingView extends StatelessWidget {
  const FullBodyStretchingView({super.key});

  @override
  Widget build(BuildContext context) {
    StretchController stretchController = Get.find();
    stretchController.fetchFullBodyStretches();
    double autoScale = Get.width / 400;
    return Scaffold(
        backgroundColor: AppColors.kWhiteColor,
        appBar: AppBar(
          surfaceTintColor: AppColors.kWhiteColor,
          title: ReusableText(
            text: "Full body Stretching",
            size: 20 * autoScale,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Obx(
          () => !stretchController.loading
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const ExerciseTopInfoCardWidget(
                          time: "5-8 mins",
                          cals: '2.3',
                          description:
                              'Relax your body and improve range of motion. It\'s also a good stretching routine for running and exercise.'),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15 * autoScale,
                        ),
                        child: Row(
                          children: [
                            ReusableText(
                              text: "Stretches",
                              color: AppColors.kOrangeColor,
                              fontWeight: FontWeight.w600,
                              size: 20 * autoScale,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20 * autoScale,
                            vertical: 10 * autoScale),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                stretchController.fullBodyStretchList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => FBStretchingView(
                                      time: stretchController
                                          .fullBodyStretchList[index].duration,
                                      image: stretchController
                                          .fullBodyStretchList[index].image,
                                      cals: stretchController
                                          .fullBodyStretchList[index].cals,
                                      description: stretchController
                                          .fullBodyStretchList[index]
                                          .instructions,
                                      title: stretchController
                                          .fullBodyStretchList[index].name,
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: stretchController.fullBodyStretchList[index].image,
                                          height: 60,
                                          imageBuilder: (context,provider) => ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8),
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
                                                  child: Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: AppColors.kOrangeColor,))),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                        ),
                                        SizedBox(
                                          width: 20 * autoScale,
                                        ),
                                        ReusableText(
                                          text: stretchController
                                              .fullBodyStretchList[index].name,
                                          fontWeight: FontWeight.w500,
                                          size: 16 * autoScale,
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Icon(
                                          CupertinoIcons.forward,
                                          size: 18 * autoScale,
                                          color: AppColors.kOrangeColor,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10 * autoScale),
                                      child: const Divider(
                                        color: AppColors.kOrangeColor,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.kOrangeColor,
                )),
        ));
  }
}
