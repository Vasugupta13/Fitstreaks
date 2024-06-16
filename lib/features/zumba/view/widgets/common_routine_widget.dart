import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonZumbaWidget extends StatelessWidget {
  final String time;
  final String image;
  final String cals;
  final String description;
  final String title;
  const CommonZumbaWidget({
    super.key,
    required this.time,
    required this.image,
    required this.cals,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: title,
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
              imageUrl: image,
              height: Get.height * 0.37,
              imageBuilder: (context,provider) => ClipRRect(
                child: Image(
                  image: provider,
                  height: Get.height * 0.37,
                  fit: BoxFit.cover,
                ),
              ),
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                      height: Get.height * 0.37,
                      child: Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: AppColors.kSkyBlueColor,))),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.63, // Initial height of the sheet from bottom
            minChildSize: 0.63, // Minimum height of the sheet when dragged down
            maxChildSize: 0.8, // Maximum height of the sheet when dragged up
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child:Column(
                    children: [
                      SizedBox(
                        height: 25 * autoScale,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20 * autoScale),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Zumba",
                                  style: GoogleFonts.openSans(
                                      fontSize: 16 * autoScale,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.kBlackColor),
                                ),
                                Text(
                                  "Level 📈",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14 * autoScale,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.kGreyColor),
                                ),
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 50,
                              color: AppColors.kLightGreyColor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  time,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16 * autoScale,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.kBlackColor),
                                ),
                                Text(
                                  "Time ⏳",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14 * autoScale,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.kGreyColor),
                                ),
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 50,
                              color: AppColors.kLightGreyColor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "≈ $cals kcal",
                                  style: GoogleFonts.openSans(
                                      fontSize: 16 * autoScale,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.kBlackColor),
                                ),
                                Text(
                                  "Calorie 🔥",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14 * autoScale,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.kGreyColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15 * autoScale,
                      ),
                      SizedBox(
                        height: 10 * autoScale,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20 * autoScale),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ReusableText(
                                  text: "Instructions",
                                  size: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kSkyBlueColor,
                                ),
                                SizedBox(
                                  height: 10 * autoScale,
                                ),
                                ReusableText(
                                  text: description.split('. ').join('.\n\n\n'),
                                  size: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
