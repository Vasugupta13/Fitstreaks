import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({
    super.key,
    required this.text,
    this.size = 15 ,
    this.fontWeight = FontWeight.w500,
    this.color= Colors.black, this.align,  this.maxLines, this.overflow, this.height,
  });
  final TextAlign? align;
  final String text;
  final double? size ;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign:align ,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}
