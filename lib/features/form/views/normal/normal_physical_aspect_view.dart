import 'package:fitstreaks/controller/pedometer_controller.dart';
import 'package:fitstreaks/features/form/controller/form_controller.dart';
import 'package:fitstreaks/features/form/views/widgets/height_scale_widget.dart';
import 'package:fitstreaks/features/form/views/widgets/weight_scale_widget.dart';
import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalPhysicalAspectView extends StatefulWidget {
  const NormalPhysicalAspectView({super.key});

  @override
  State<NormalPhysicalAspectView> createState() =>
      _NormalPhysicalAspectViewState();
}

class _NormalPhysicalAspectViewState
    extends State<NormalPhysicalAspectView> {
  TextEditingController ageController = TextEditingController();
  PedometerController pedometerController = Get.put(PedometerController(),permanent: true);
  WeightType weightType = WeightType.kg;
  HeightType heightType = HeightType.cm;
  double weight = 50;
  double height = 150;
  @override
  Widget build(BuildContext context) {
    FormController formController = Get.put(FormController());
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: ReusableText(
                    text: "What are your physical measurements ?",
                    size: 20,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ReusableText(
                  text: "Please provide your height, weight and age.",
                  size: 14,
                  align: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kGreyColor,
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Expanded(
                      flex: 2,
                      child: SizedBox()),
                  const ReusableText(
                    text: 'Age',
                    size: 18,
                    fontWeight: FontWeight.w600,

                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      controller: ageController,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize:16,color:AppColors.kBlackColor),
                      cursorColor: AppColors.kBlueColor,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "5-100",
                          hintStyle: GoogleFonts.poppins(fontSize:16,color:AppColors.kLightGreyColor),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.kLightGreyColor)),
                          focusedBorder:  const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.kBlueColor,width: 1.5))
                      ),
                      keyboardType: TextInputType.number, // Only allow numerical input
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const ReusableText(
                      text: 'yrs',
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color:AppColors.kBlueColor
                  ),
                  const Expanded(
                      flex: 2,
                      child: SizedBox()),
                ],
              ),
            ),
            Column(
              children: [
                WeightSelector(
                  initialWeightType: weightType,
                  initialWeight: weight,
                  onWeightChanged: (double value) {
                    setState(() {
                      weight = value;
                    });
                  },
                  onTypeChanged: (WeightType value) {
                    setState(() {
                      weightType = value;
                    });
                  },
                ),
                HeightSelector(
                  initialHeightType: heightType,
                  initialHeight: height,
                  onHeightChanged: (double value) {
                    setState(() {
                      height = value;
                    });
                  },
                  onTypeChanged: (HeightType value) {
                    setState(() {
                      heightType = value;
                    });
                  },
                ),
              ],
            ),
            const Expanded(
                child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ReusableButton(
                text: 'Next',
                onPressed: () async {
                  if(ageController.text.isEmpty || int.parse(ageController.text) < 6 || int.parse(ageController.text) > 100 ){
                    SnackBarService.showSnackBar(context: context, message: "Age limit - 5 to 100 yrs", backgroundColor: AppColors.kRedAccent);
                    return;
                  }
                  formController.changeFormProgress(
                    title: "selectedHeightWeight" ,
                    value: true,
                  );
                  formController
                      .changeUserDetails(
                    title: "selectedWeight",
                    value: weight.toString() + weightType.name,

                  );
                  formController
                      .changeUserDetails(
                    title: "selectedHeight",
                    value: "$height cm",
                  );
                  formController
                      .changeUserDetails(
                    title: "selectedAge",
                    value: ageController.text,
                  );
                  formController
                      .setFormCompleteStatus();
                  await formController.setUserStepDetails();
                  Future<HomeController> initializeControllers() async {
                    final controller = HomeController();
                    await controller.init();
                    return controller;
                  }
                  await Get.putAsync(initializeControllers,permanent: true);
                  await pedometerController.setStepsForNewUser();
                  await Future.delayed(const Duration(seconds: 2));

                },
                borderWidth: 1,
                weight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
