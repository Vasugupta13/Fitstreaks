import 'package:fitstreaks/features/auth/controller/register_controller.dart';
import 'package:fitstreaks/features/auth/view/login_view.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/resuable_text_field.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RegisterController registerController = Get.put(RegisterController());
  bool isFieldSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackGroundColor,
        elevation: 0,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            Get.off(() => const LoginView());
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 30,
            color: AppColors.kBlackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: Image.asset(ImageAssets.kLogo),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ReusableText(
                  text: 'Welcome! Register to get started.',
                  color: AppColors.kBlackColor,
                  size: 25,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableText(
                  text: 'Enter all your credentials to register.',
                  color: AppColors.kGreyColor,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableText(
                  text: 'Register',
                  color: AppColors.kBlackColor,
                  size: 25,
                  fontWeight: FontWeight.w600,
                ),
                EditProfileFields(
                  text: 'Name',
                  controller: nameController,
                  isProtected: false,
                  textInputType: TextInputType.name,
                  color: Colors.black,
                ),
                EditProfileFields(
                  text: 'Email',
                  controller: emailController,
                  isProtected: false,
                  textInputType: TextInputType.emailAddress,
                  color: Colors.black,
                ),
                EditProfileFields(
                  text: 'Password',
                  controller: passwordController,
                  isProtected: true,
                  textInputType: TextInputType.visiblePassword,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Obx(()=>
                      SizedBox(
                      height: 40,
                      width: 180,
                      child:!registerController.loading.value? ReusableButton(
                        borderRadius: 15,
                        weight: FontWeight.w500,
                        size: 18,
                        borderWidth: 1,
                        onPressed: () {
                          registerController.register(
                            nameController: nameController,
                            passwordController: passwordController,
                            emailController: emailController,
                            context: context,
                          );
                        },
                        text: 'Register',
                      ):const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: AppColors.kBlueColor,),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const ReusableText(
                        text: 'Already have an account?',
                        color: AppColors.kBlackColor,
                        size: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => const LoginView());
                        },
                        child: const ReusableText(
                          text: 'Login',
                          color: AppColors.kBlueColor,
                          size: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
