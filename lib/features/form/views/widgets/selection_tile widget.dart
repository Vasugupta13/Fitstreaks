import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';

class SelectionTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final Color borderColor;
  final String title;
  final String? title2;
  final double? fontSize;
  const SelectionTileWidget({super.key, this.onTap, required this.borderColor, required this.title, this.title2, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.kWhiteColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: AppColors.kLightGreyColor,
                  offset: const Offset(0,0),
                )
              ],
              border: Border.all(color: borderColor)
          ),child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableText(
              text: title,
              size: fontSize ?? 20,
              fontWeight: FontWeight.w400,
              color: AppColors.kBlackColor,
            ),
            ReusableText(
              text:" ${title2 ?? ''}",
              size: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.kGreyColor,
            ),
          ],),
        ),
      ),
    );
  }
}
