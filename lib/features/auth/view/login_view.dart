import 'package:fitstreaks/features/auth/controller/login_controler.dart';
import 'package:fitstreaks/features/auth/view/register_view.dart';
import 'package:fitstreaks/res/assets.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/resuable_text_field.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isFieldSubmitted = false;
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.kBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 60,
                  child: Image.asset(ImageAssets.kLogo),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ReusableText(
                  text: 'Welcome Back Fit Streaker !',
                  color: AppColors.kBlackColor,
                  size: 25,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableText(
                  text: 'Enter your credentials to login.',
                  color: AppColors.kGreyColor,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableText(
                  text: 'Login',
                  color: AppColors.kBlackColor,
                  size: 25,
                  fontWeight: FontWeight.w600,
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
                  child: Obx(
                    () => SizedBox(
                      height: 40,
                      width: 180,
                      child: !loginController.loading.value
                          ? ReusableButton(
                              borderRadius: 15,
                              weight: FontWeight.w500,
                              size: 18,
                              borderWidth: 1,
                              onPressed: () {
                                loginController.login(
                                    passwordController: passwordController,
                                    emailController: emailController,
                                    context: context);
                              },
                              text: 'Login',
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: AppColors.kBlueColor,
                                ),
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
                        text: 'Don\'t have an account?',
                        color: AppColors.kBlackColor,
                        size: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => const RegisterView());
                        },
                        child: const ReusableText(
                          text: 'Register',
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
