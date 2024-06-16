import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileFields extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? currNode;
  final bool? readOnly;
  final int? maxLength;
  final bool? isSubmitted;
  final bool isProtected;
  final void Function(String)? onSubmit;
  final String text;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextInputType? textInputType;
  final Color? color;
  final Widget? prefix;
  const EditProfileFields({
    super.key,
    required this.controller,
    this.currNode,
    this.isSubmitted,
    this.onSubmit,
    required this.text,
    required this.isProtected,
    this.color,
    this.textInputType,
    this.readOnly,
    this.maxLength,
    this.prefix,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width1 = Get.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 12, horizontal: horizontalPadding ?? 0),
      child: Center(
        child: SizedBox(
          height: maxLength != null ? height * 0.09 : height * 0.06,
          width: width1 * 0.95,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextFormField(
                  maxLength: maxLength,
                  readOnly: readOnly ?? false,
                  keyboardType: textInputType,
                  obscureText: isProtected,
                  controller: controller,
                  focusNode: currNode,
                  onFieldSubmitted: onSubmit,
                  cursorColor: Colors.black,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: prefix,
                    prefixIconConstraints:
                        const BoxConstraints(minHeight: 20, minWidth: 50),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.all(10),
                    hintStyle: GoogleFonts.poppins(
                      color: AppColors.kGreyColor,
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    Container(
                      color: AppColors.kBackGroundColor,
                      child: ReusableText(
                        text: ' $text ',
                        color: color ?? AppColors.kLightGreyColor,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
