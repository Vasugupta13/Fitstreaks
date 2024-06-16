import 'package:fitstreaks/features/zumba/controller/zumba_controller.dart';
import 'package:fitstreaks/features/zumba/view/widgets/common_routine_widget.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZumbaRoutineWidget extends StatelessWidget {
  const ZumbaRoutineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    ZumbaController zumbaController = Get.find();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: zumbaController.zumbaRoutineList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20 * autoScale),
            child: GestureDetector(
              onTap: (){
                Get.to(
                      () => CommonZumbaWidget(
                    time: zumbaController.zumbaRoutineList[index].duration,
                    image: zumbaController
                        .zumbaRoutineList[index].image,
                    cals: zumbaController.zumbaRoutineList[index].cals,
                    description: zumbaController
                        .zumbaRoutineList[index]
                        .description,
                    title: zumbaController
                        .zumbaRoutineList[index].name,
                  ),
                );
              },
              child: Column(
                children: [
                  SizedBox(height: 8 * autoScale ,),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: zumbaController.zumbaRoutineList[index].name,
                        fontWeight: FontWeight.w500,
                        size: 16 * autoScale,
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(
                        CupertinoIcons.forward,
                        size: 18 * autoScale,
                        color: AppColors.kSkyBlueColor,
                      )
                    ],
                  ),
                  SizedBox(height: 8 * autoScale ,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8 * autoScale),
                    child: const Divider(
                      color: AppColors.kSkyBlueColor,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
