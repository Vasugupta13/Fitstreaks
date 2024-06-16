import 'package:fitstreaks/features/zumba/controller/zumba_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ZumbaInstructionWidget extends StatelessWidget {
  const ZumbaInstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    ZumbaController zumbaController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGreyColor.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Obx(()=>
              ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onExpansionChanged: (bool expanding) =>
              zumbaController.isExpanded.value = expanding,
              backgroundColor: Colors.white,
              title: ReusableText(
                text: "Instructions",
                color: AppColors.kSkyBlueColor,
                size: 20 * autoScale,
                fontWeight: FontWeight.w500,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    zumbaController.zumbaInstructions.value!.info,
                    style: GoogleFonts.openSans(
                      color: AppColors.kDarkBg,
                      fontSize: 14 * autoScale,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableText(
                    text:
                        "• ${zumbaController.zumbaInstructions.value!.notes.join("\n\n• ")}",
                    color: AppColors.kDarkGreyColor,
                    size: 12 * autoScale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
