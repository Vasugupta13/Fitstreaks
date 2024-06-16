import 'package:fitstreaks/res/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? horizontal;
  final double? vertical;
  final Color? color;
  final Color? fontColor;
  final double? size;
  final double borderRadius;
  final FontWeight? weight;
  final double? borderWidth;
  const ReusableButton({
    super.key,
    this.borderRadius = 8,
    required this.text,
    this.horizontal,
    this.vertical,
    this.color,
    this.onPressed,
    this.size = 20,
    this.weight = FontWeight.w600,
    this.borderWidth = 2,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: borderWidth ?? 2,
                color: AppColors.kBlackColor,
              ),
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: color ?? AppColors.kBlueColor,
          padding: EdgeInsets.symmetric(
              vertical: vertical ?? 0, horizontal: horizontal ?? 0)),
      child: Align(
        alignment: Alignment.center,
        child: Text(text,
            style: GoogleFonts.poppins(
                fontWeight: weight,
                fontSize: size,
                color: fontColor ?? AppColors.kWhiteColor)),
      ),
    );
  }
}
