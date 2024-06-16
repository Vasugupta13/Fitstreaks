import 'package:fitstreaks/features/zumba/controller/zumba_controller.dart';
import 'package:fitstreaks/features/zumba/view/widgets/zumba_instruction_widget.dart';
import 'package:fitstreaks/features/zumba/view/widgets/zumba_routine_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZumbaView extends StatefulWidget {
  const ZumbaView({super.key});

  @override
  State<ZumbaView> createState() => _ZumbaViewState();
}

class _ZumbaViewState extends State<ZumbaView> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    ZumbaController zumbaController = Get.put(ZumbaController());
    zumbaController.fetchZumbaInstructions();
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Zumba",
          size: 22 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => !zumbaController.loading
            ? ListView(
                children: const [
                  ZumbaInstructionWidget(),
                  SizedBox(height: 10,),
                  ReusableText(
                    text: "   Routines",
                    color: AppColors.kSkyBlueColor,
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10,),
                  ZumbaRoutineWidget()
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kSkyBlueColor,
                ),
              ),
      ),
    );
  }
}
