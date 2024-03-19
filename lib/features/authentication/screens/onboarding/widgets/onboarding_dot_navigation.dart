import 'package:flutter/material.dart';
import 'package:shoping_app/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/device/device_utility.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: SDeviceUtility.getBottomNavigationBarHeight() + 25,
        left: SSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? SColors.light : SColors.dark, dotHeight: 6),
        ));
  }
}