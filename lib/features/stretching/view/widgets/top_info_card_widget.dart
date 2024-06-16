import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseTopInfoCardWidget extends StatelessWidget {
  final String? level;
  final String time;
  final String cals;
  final String description;
  const ExerciseTopInfoCardWidget({
    super.key,
     this.level,
    required this.time,
    required this.cals,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 15 * autoScale, vertical: 15 * autoScale),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.kGreyColor.withOpacity(0.5),
                offset: const Offset(0, 0),
                blurRadius: 10,
              )
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 20 * autoScale,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10 * autoScale),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex:3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                         level ?? "Stretching" ,
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
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color: AppColors.kLightGreyColor,
                  ),
                  Expanded(
                    flex:4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color: AppColors.kLightGreyColor,
                  ),
                  Expanded(
                    flex:4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15 * autoScale,
              ),
              child:  ReusableText(
                  text: description),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
