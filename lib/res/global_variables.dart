import 'package:fitstreaks/features/exercises/view/abs_exercise_view.dart';
import 'package:fitstreaks/features/exercises/view/arms_exercise_view.dart';
import 'package:fitstreaks/features/exercises/view/chest_exercise_view.dart';
import 'package:fitstreaks/features/exercises/view/legs_exercise_view.dart';
import 'package:fitstreaks/features/exercises/view/muscle_building_exercise_view.dart';
import 'package:fitstreaks/features/exercises/view/shoulder_back_exercise_view.dart';
import 'package:fitstreaks/features/stretching/view/full_body_stretching_view.dart';
import 'package:fitstreaks/features/stretching/view/lower_body_stretch_view.dart';
import 'package:fitstreaks/features/stretching/view/morning_warm_up_view.dart';
import 'package:fitstreaks/features/stretching/view/shoulder_stretch_view.dart';
import 'package:fitstreaks/features/stretching/view/upper_body_stretch_view.dart';
import 'package:flutter/material.dart';

class AppColors{
  static const Color kBlackColor = Colors.black;
  static const Color kWhiteColor = Colors.white;
  static const Color kBlueColor = Color(0xff1c69f8);
  static const Color kDarkBg = Color(0xff25252a);
  static const Color kRedAccent = Colors.redAccent;
  static Color kGreyColor = Colors.grey.shade600;
  static Color kDarkGreyColor = Colors.grey.shade800;
  static Color kLightGreyColor = Colors.grey.shade300;
  static const Color kBackGroundColor = Color(0xffffffff);
  static const Color kGreenColor = Color(0xff90D855);
  static const Color kLightGreenColor = Color(0xffa1e16e);
  static const Color kYellowColor = Color(0xfff4cc60);
  static const Color kLightYellowColor = Color(0xfffadc88);
  static const Color kSkyBlueColor = Color(0xff5fa9f6);
  static const Color kLightSkyBlueColor = Color(0xff91bbea);
  static const Color kPurpleColor = Color(0xffa879ff);
  static const Color kLightPurpleColor = Color(0xffc8affc);
  static const Color kOrangeColor = Color(0xfffcab58);
  static const Color kLightOrangeColor = Color(0xffffc866);
  static const Color kPinkColor = Color(0xffff89e5);
  static const Color kLightPinkColor = Color(0xfffdc4e5);
  static const Color kGreenishBlueColor = Color(0xff76E1F6);
  static const Color kLightGreenishBlueColor = Color(0xffbdfcfc);
}

List<int> targetDaysList = [1,2,3,4,5,6,7];

List<Map<String,dynamic>> stretchingLists = [
  {
    "name": "Full Body",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/stretching%2Ffb_main.png?alt=media&token=805a54cf-a737-4336-b164-8df367e71ae5",
    "description": "Best for full body stretching",
    "page" : const FullBodyStretchingView(),
  },
  {
    "name": "Morning Warm-up",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/stretching%2Fm_main.png?alt=media&token=50ca19a1-4fcb-4593-a427-a584e76cb45c",
    "description": "Warm up stretching for morning",
    "page" : const MorningWarmUpView(),
  },
  {
    "name": "Shoulder Stretch",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/stretching%2Fsh_main.png?alt=media&token=8147ece6-2a17-4e3b-bae4-1ce0dcc84233",
    "description": "Reliefs shoulder stiffness and soreness",
    "page" : const ShoulderStretchingView(),
  },
  {
    "name": "Upper Body Stretch",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/stretching%2Fub_main.png?alt=media&token=2222a255-d473-4b86-95b7-084d9520f967",
    "description": "Stretch whole upper body",
    "page" : const UpperBodyStretchingView(),
  },
  {
    "name": "Lower Body Stretch",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/stretching%2Flb_main.png?alt=media&token=53dd88b8-a56d-47b2-a6b7-e755d568b6d9",
    "description": "Stretch whole upper body",
    "page" : const LowerBodyStretchView(),
  }
];

List<Map<String,dynamic>> recommendedPlans = [
  {
    "name": "Weight Loss",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/diet%2Fimage-Photoroom.png-Photoroom%20(28).png?alt=media&token=18d4d05d-ac70-45d5-8670-79d60dfd7e64",
  },
  {
    "name": "Weight Gain",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/diet%2Fimage-Photoroom.png-Photoroom%20(30).png?alt=media&token=8a66eda3-927c-4b1b-9b5d-a79652fc0061",
  },
  {
    "name": "Nutritional needs",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/diet%2Fyoung-women-like-eat-vegetables-pink2.png?alt=media&token=96d6d9af-e1b3-4947-9efc-b55acbd42461",
  },
];

List<Map<String,dynamic>> allExercise = [
  {
    "name": "Abs Workout",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/exercises%2Fabs_main.png?alt=media&token=d455a4f5-3d5b-46cd-bdba-486c4ec0375e",
    "mainColor" : AppColors.kSkyBlueColor,
    "lightColor" : AppColors.kLightSkyBlueColor,
    "opacityColor" : AppColors.kLightSkyBlueColor.withOpacity(0),
    "page" : const AbsExerciseView(),
    "description": "An abs workout strengthens core muscles, improves posture, enhances stability, and reduces the risk of back pain. It also contributes to a toned midsection, boosting overall fitness and physical appearance."
  },
  {
    "name": "Arms Workout",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/exercises%2Farm_main.png?alt=media&token=06c7ede5-75f9-46c1-9c7b-a089c67f7655",
    "mainColor" : AppColors.kYellowColor,
    "lightColor" : AppColors.kLightYellowColor,
    "opacityColor" : AppColors.kLightYellowColor.withOpacity(0),
    "page" : const ArmsExerciseView(),
    "description": "Arms workouts strengthen muscles, enhance endurance, improve grip strength, boost metabolism, and promote overall upper body fitness. They also aid in injury prevention and enhance daily functional movements."
  },
  {
    "name": "Chest Workout",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/exercises%2Fchest.png?alt=media&token=286f5896-5a4c-49a3-8840-18e6e0ccfab6",
    "mainColor" : AppColors.kPinkColor,
    "lightColor" : AppColors.kLightPinkColor,
    "opacityColor" : AppColors.kLightPinkColor.withOpacity(0),
    "page" : const ChestExerciseView(),
    "description": "Chest workouts strengthen the pectoral muscles, enhancing upper body strength and stability. They improve posture, support daily activities, boost cardiovascular health, and enhance physical appearance, promoting overall fitness and confidence."
  },
  {
    "name": "Legs Workout",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/exercises%2Flegs_main.png?alt=media&token=73d4f903-f1ee-44cb-b592-2aaf64d0c977",
    "mainColor" : AppColors.kGreenishBlueColor,
    "lightColor" : AppColors.kLightGreenishBlueColor,
    "opacityColor" : AppColors.kLightGreenishBlueColor.withOpacity(0),
    "page" : const LegsExerciseView(),
    "description": "Leg workouts enhance lower body strength, improve balance, boost metabolism, and support overall athletic performance. They also promote joint health, aid in fat loss, and contribute to a well-proportioned physique."
  },
  {
    "name": "Muscle Building",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/exercises%2Fmb_main.png?alt=media&token=ca8be069-814d-4d45-9681-df91c4d78542",
    "mainColor" : AppColors.kPurpleColor,
    "lightColor" : AppColors.kLightPurpleColor,
    "opacityColor" : AppColors.kLightPurpleColor.withOpacity(0),
    "page" : const MuscleBuildingView(),
    "description": "Muscle-building workouts enhance strength, boost metabolism, improve posture, and increase bone density. They also support weight management, enhance mood, and reduce the risk of chronic diseases, promoting overall health and well-being."
  },
  {
    "name": "Shoulder & Back Workout",
    "image": "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/exercises%2Fsb.png?alt=media&token=a02e31af-54b1-4595-9e89-aad9e8098dee",
    "mainColor" : AppColors.kOrangeColor,
    "lightColor" : AppColors.kLightOrangeColor,
    "opacityColor" : AppColors.kLightOrangeColor.withOpacity(0),
    "page" : const ShoulderBackExerciseView(),
    "description": "Shoulder and back workouts improve posture, enhance upper body strength, and increase stability. They help prevent injuries, alleviate pain, and contribute to a balanced, muscular physique, boosting overall physical performance and health."
  },
];

const String GEMINI_KEY = "AIzaSyDFXjw8xbVBItQ8qNDC3Oo78gt1NYsef8w";