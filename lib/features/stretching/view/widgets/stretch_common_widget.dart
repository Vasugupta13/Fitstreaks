import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StretchCommonWidget extends StatelessWidget {
  final String image;
  final String time;
  final String cals;
  final String description;
  final String? title1;
  final String? subtitle1;
  final String? title2;
  final String? subtitle2;
  final String? title3;
  final String? subtitle3;
  const StretchCommonWidget({super.key, required this.image, required this.time, required this.cals, required this.description, this.title1, this.subtitle1, this.title2, this.subtitle2, this.title3, this.subtitle3});

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CachedNetworkImage(
            imageUrl: image,
            height: Get.height * 0.37,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                SizedBox(
                    height: Get.height * 0.37,
                    child: Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: AppColors.kOrangeColor,))),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Get.height * 0.59,
            decoration: const BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            ),child: Column(
            children: [
              SizedBox(height: 25 * autoScale,),
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
                          "Stretch",
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
              SizedBox(height: 15 * autoScale,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * autoScale),
                child: ReusableText(text:description,),
              ),
              SizedBox(height: 10 * autoScale,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * autoScale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(text: title1 ?? "",size: 18,fontWeight: FontWeight.w600,color: AppColors.kOrangeColor,),
                        ReusableText(text: subtitle1 ?? "",size: 14,fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(height: 12 * autoScale,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(text: title2 ?? "",size: 18,fontWeight: FontWeight.w600,color: AppColors.kOrangeColor,),
                        ReusableText(text: subtitle2 ?? "",size: 14,fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(height: 12 * autoScale,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(text: title3 ?? "",size: 18,fontWeight: FontWeight.w600,color: AppColors.kOrangeColor,),
                        ReusableText(text: subtitle3 ?? "",size: 14,fontWeight: FontWeight.w400,),
                      ],
                    )
                  ],
                ),
              )
            ],),
          ),
        )
      ],
    );
  }
}
