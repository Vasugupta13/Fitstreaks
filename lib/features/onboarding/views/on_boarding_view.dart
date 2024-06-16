import 'package:fitstreaks/features/auth/view/login_view.dart';
import 'package:fitstreaks/features/onboarding/views/widgets/IntroPage1.dart';
import 'package:fitstreaks/features/onboarding/views/widgets/IntroPage2.dart';
import 'package:fitstreaks/features/onboarding/views/widgets/IntroPage3.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 12,
                      activeDotColor:AppColors.kBlueColor,
                      dotColor: AppColors.kLightGreyColor,),
                ),
                const SizedBox(
                  height: 35,
                ),
                onLastPage
                    ? SizedBox(
                  height: 35,
                  width: 170,
                  child: ReusableButton(
                    borderRadius: 15,
                    text: 'Get Started',
                    size: 20,
                    weight: FontWeight.w600,
                    onPressed: () {
                   Get.off(const LoginView());
                    },
                  ),
                )
                    : SizedBox(
                  height: 35,
                  width: 150,
                  child: ReusableButton(
                    borderRadius: 15,
                    text: 'Next',
                    weight: FontWeight.w600,
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                onLastPage?
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child:  Text(
                        '',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        )
                    )):GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child:  Text(
                        'Skip',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        )
                    )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
