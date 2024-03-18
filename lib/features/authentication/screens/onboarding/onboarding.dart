import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_app/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shoping_app/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:shoping_app/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:shoping_app/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

import '../widgets/onboarding_next_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());


    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                  image: SImage.onBoardingImage1,
                  title: SText.onBoardingTitle1,
                  subTitle: SText.onBoardingSubTitle1),
              OnBoardingPage(
                  image: SImage.onBoardingImage2,
                  title: SText.onBoardingTitle2,
                  subTitle: SText.onBoardingSubTitle2),
              OnBoardingPage(
                  image: SImage.onBoardingImage3,
                  title: SText.onBoardingTitle3,
                  subTitle: SText.onBoardingSubTitle3),
            ],
          ),

          /// Skip Button
          OnBordingSkip(),

          /// Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          /// Circular Button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}




