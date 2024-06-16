import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitstreaks/features/form/views/select_person_type.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/snackbar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  RxBool loading = false.obs;
  Future<void> register({
    required TextEditingController nameController,
    required TextEditingController passwordController,
    required TextEditingController emailController,
    required BuildContext context,
  }) async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Validate name
    if (name.isEmpty || name.length <= 2 || !RegExp(r'^[a-zA-Z ]*$').hasMatch(name)) {
      SnackBarService.showSnackBar(
          context: context,
          message: "Enter a valid name",
          backgroundColor: AppColors.kRedAccent);
      return;
    }

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
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      loading.value = false;
      Get.offAll(()=>const SelectPersonType());
      _dbRef.child(userCredential.user!.uid).child('User-Details').set({
        'formCompleted': false,
        'userEmail' : email,
      });
    } on FirebaseAuthException catch (e) {
      loading.value = false;
      if (e.code == 'weak-password') {
        SnackBarService.showSnackBar(
            context: context,
            message: "The password provided is too weak.",
            backgroundColor: AppColors.kRedAccent);
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
            context: context,
            message: "The account already exists for that email.",
            backgroundColor: AppColors.kRedAccent);
      }
    } catch (e) {
      loading.value = false;
      print(e);
    }
  }
}
