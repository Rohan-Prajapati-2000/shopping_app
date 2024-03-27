import 'package:flutter/material.dart';
import 'package:shoping_app/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/device/device_utility.dart';

class OnBordingSkip extends StatelessWidget {
  const OnBordingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: SDeviceUtility.getAppBarHeight(),
        right: SSizes.defaultSpace,
        child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: const Text("Skip")));
  }
}