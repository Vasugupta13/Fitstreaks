import 'package:fitstreaks/features/auth/controller/login_controler.dart';
import 'package:fitstreaks/features/chat_bot/view/gemini_chat_view.dart';
import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/features/home/views/widget/disabled_home_view.dart';
import 'package:fitstreaks/features/home/views/widget/home_step_counter_widget.dart';
import 'package:fitstreaks/features/home/views/widget/normal_home_view.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final bool isDisabled;
  const HomeView({super.key, required this.isDisabled});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.kWhiteColor,
        iconTheme: const IconThemeData(
          color: AppColors.kBlueColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {
                  homeController.logout();
                },
                child: const Icon(
                  Icons.logout_rounded,
                  color: AppColors.kBlueColor,
                )),
          )
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.kLogo,
              height: 30 * autoScale,
            ),
            ReusableText(
              text: "  Fit Streaks",
              size: 22 * autoScale,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: homeController.isDisabled.value
          ? DisabledHomeView(
              disabilityType: homeController.typeOfDisability.value,
            )
          : const NormalHomeView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ChatBotScreen(
                gender: homeController.gender.value,
                age: homeController.age.value,
                height: homeController.height.value,
                weight: homeController.weight.value,
                isDisabled: homeController.isDisabled.value,
              ));
        },
        child: const Icon(
          Icons.chat,
          color: AppColors.kWhiteColor,
        ), // The chat icon
        backgroundColor: AppColors.kSkyBlueColor, // The blue background
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
