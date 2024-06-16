import 'package:fitstreaks/features/stretching/controller/stretching_controller.dart';
import 'package:fitstreaks/features/stretching/view/widgets/stretching_grid_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StretchingView extends StatelessWidget {
  const StretchingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StretchController());
    double autoScale = Get.width / 400;
    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.white,
        title:  ReusableText(text: "Stretching",size: 20 * autoScale,fontWeight: FontWeight.w500,),
      ),
      backgroundColor: AppColors.kWhiteColor,
      body:const Padding(
        padding: EdgeInsets.all(8.0),
        child: StretchingGridWidget(),
      )
    );
  }
}
