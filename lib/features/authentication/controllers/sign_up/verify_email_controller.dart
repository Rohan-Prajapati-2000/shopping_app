import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/success_screen/success_screen.dart';
import 'package:shoping_app/data/repositories/authentication/authentication_repositories.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import 'package:shoping_app/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send email whenever verify screen appears & Set timer for auto redirection
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SLoaders.successSnackBar(
          title: 'Email Sent',
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            animationLottie: SImage.verify1,
            title: SText.yourAccountCreatedTitle,
            subtitle: SText.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            animationLottie: SImage.verify1,
            title: SText.yourAccountCreatedTitle,
            subtitle: SText.yourAccountCreatedSubTitle,
            onPressed: ()=> AuthenticationRepository.instance.screenRedirect()
        ),
      );
    }
  }
}
