import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_gender_select_view.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_motivation_select.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_physical_aspect_view.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_previous_experience.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_type_view.dart';
import 'package:fitstreaks/features/form/views/disabled/disabled_workout_days_selection_view.dart';
import 'package:fitstreaks/features/form/views/normal/normal_activity_selection_view.dart';
import 'package:fitstreaks/features/form/views/normal/normal_gender_select_view.dart';
import 'package:fitstreaks/features/form/views/normal/normal_motivation_select_view.dart';
import 'package:fitstreaks/features/form/views/normal/normal_push_ups_selection_view.dart';
import 'package:fitstreaks/features/form/views/normal/normal_workout_days_selection_view.dart';
import 'package:fitstreaks/features/form/views/select_person_type.dart';
import 'package:fitstreaks/features/home/controller/home_controller.dart';
import 'package:fitstreaks/model/disabled_form_model.dart';
import 'package:fitstreaks/model/normal_form_model.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  RxBool loading = false.obs;
  Future<void> login({
    required TextEditingController passwordController,
    required TextEditingController emailController,
    required BuildContext context,
  }) async {
    String email = emailController.text;
    String password = passwordController.text;

    // Validate email
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      SnackBarService.showSnackBar(
          context: context,
          message: "Enter a valid email",
          backgroundColor: AppColors.kRedAccent);
      return;
    }

    // Validate password
    if (password.isEmpty || password.length < 7) {
      SnackBarService.showSnackBar(
          context: context,
          message: "Enter a valid password",
          backgroundColor: AppColors.kRedAccent);
      return;
    }

    try {
      loading.value = true;
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final event = await _dbRef.child(userCredential.user!.uid).child('User-Details').child('formCompleted').get();
      bool formCompleted = event.value.toString() == "true"? true : false;
      if(!formCompleted){
        final snapshot = await _dbRef.child(userCredential.user!.uid).child('User-Details').child('isDisabled').get();
        if(snapshot.exists){
          bool isDisabled = snapshot.value.toString() == "true" ? true : false;
          if(isDisabled){
            final allData = await _dbRef.child(userCredential.user!.uid).child('Form-Progress').once();
            DisabledFormModel disabledFormModel = DisabledFormModel.fromSnapshot(allData.snapshot.value);
            loading.value = false;
             if (!disabledFormModel.selectedGender!){
              Get.off(const DisabledGenderSelection());
            }else if (!disabledFormModel.selectedMotivation!){
               Get.off(const DisabledMotivationSelection());
            }else if(!disabledFormModel.selectedTypeOfDisability!){
              Get.off(const DisabledTypeSelection());
            }else if(!disabledFormModel.selectedPreviousWorkout!){
              Get.off(const DisabledPreviousExp());
            }else if(!disabledFormModel.selectedWorkoutDays!){
               Get.off(const DisabledWorkoutDaysSelection());
            }else if(!disabledFormModel.selectedHeightWeight!){
               Get.off(const DisabledPhysicalAspectView());
            }else{
               print("Home");
             }

          }else{
            final allData = await _dbRef.child(userCredential.user!.uid).child('Form-Progress').once();
            NormalFormModel normalFormModel = NormalFormModel.fromSnapshot(allData.snapshot.value);
            loading.value = false;
            if(!normalFormModel.selectedGender!){
              Get.off(const NormalGenderSelectView());
            }else if (!normalFormModel.selectedMotivation!){
              Get.off(const NormalMotivationSelection());
            }else if(!normalFormModel.selectedPushUpLevel!){
              Get.off(const NormalPushUpSelectionView());
            }else if(!normalFormModel.selectedActivityLevel!){
              Get.off(const NormalActivitySelectionView());
            }else if(!normalFormModel.selectedWorkoutDays!){
               Get.off(const NormalWorkoutDaysSelection());
            }else if(!normalFormModel.selectedHeightWeight!){
                  Get.off(const DisabledPhysicalAspectView());
            }else{
              print("ome");
            }
          }
        }else{
          loading.value = false;
          Get.off(()=>const SelectPersonType());
        }

      }else{
        loading.value = false;
        Future<HomeController> initializeControllers() async {
          final controller = HomeController();
          await controller.init();
          return controller;
        }
        Get.putAsync(initializeControllers,permanent: true);
      }
    } on FirebaseAuthException catch (e) {
      loading.value = false;
      if (e.code == 'user-not-found') {
        SnackBarService.showSnackBar(
            context: context,
            message: "No user found for that email.",
            backgroundColor: AppColors.kRedAccent);
      } else if (e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
            context: context,
            message: "Wrong password provided for that user.",
            backgroundColor: AppColors.kRedAccent);
      } else if (e.code == 'invalid-credential') { // Add this condition
        SnackBarService.showSnackBar(
            context: context,
            message: "The provided credentials are incorrect.",
            backgroundColor: AppColors.kRedAccent);
      }
    } catch (e) {
      print(e);
    }
  }
}
