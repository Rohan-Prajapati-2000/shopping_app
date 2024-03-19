import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/device/device_utility.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
        right: SSizes.defaultSpace,
        bottom: SDeviceUtility.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: dark ? SColors.primaryColor : Colors.black),
            child: Icon(Iconsax.arrow_right_3)));
  }
}
