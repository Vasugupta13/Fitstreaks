import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/controller/pedometer_controller.dart';
import 'package:fitstreaks/features/auth/view/login_view.dart';
import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/features/home/views/home_view.dart';
import 'package:fitstreaks/features/onboarding/views/on_boarding_view.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final int duration = 500;
  bool isSignedIn = false;
  void loadConditions()async{
    User? user = _auth.currentUser;
    if(user == null){
      isSignedIn = false;
      return;
    }
      final event = await _dbRef.child(_auth.currentUser!.uid).child('User-Details').child('formCompleted').get();
      bool formCompleted = event.value.toString() == "true"? true : false;
      if(!formCompleted){
        isSignedIn = false;
        return;
      }

    isSignedIn = true;
  }
  @override
  void initState() {
    super.initState();
    loadConditions();
    Future.delayed(Duration(milliseconds: duration * 6), () {
      if (isSignedIn) {
        Future<HomeController> initializeControllers() async {
          final controller = HomeController();
          await controller.init();
          return controller;
        }
        Get.putAsync(initializeControllers,permanent: true);
      } else {
        Get.off(()=>const OnBoardingScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FadeInUpBig(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.kLogo,
                    height: 150,
                  ),
                  Text(
                    "Fit Streaks",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kBlackColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
