import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/data/repositories/authentication/authentication_repositories.dart';
import 'package:shoping_app/data/user/user_repository.dart';
import 'package:shoping_app/features/authentication/models/user_model/user_model.dart';
import 'package:shoping_app/features/authentication/screens/signup/verify_email.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/helpers/network_manager.dart';
import 'package:shoping_app/utils/popups/full_screen_loader.dart';
import 'package:shoping_app/utils/popups/loaders.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;  // Observable for hiding/showing password
  final privacyPolicy = true.obs;  // Observable for privacy policy
  final email = TextEditingController(); // Controller for the email input
  final firstName = TextEditingController(); // Controller for the first Name input
  final lastName = TextEditingController(); // Controller for the lastName input
  final userName = TextEditingController(); // Controller for the User Name input
  final password = TextEditingController(); // Controller for the Password input
  final phoneNumber = TextEditingController(); // Controller for the Phone Number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form Key for form Validation

  /// SignUp

  Future<void> signUp() async {
    try{
    //   // Start Loading
      SFullScreenLoaders.openLoadingDialog('We are processing your information...', SImage.loadingAnimation);

    //   // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoaders.stopLoading();
        return;
      };

    //   // Form Validation
      if(!signupFormKey.currentState!.validate()) {
        SFullScreenLoaders.stopLoading();
        return;
      };

      // Privacy Policy
      if(!privacyPolicy.value){
        SLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use'
        );
        return;
      }

      // Register User in the FireBase Authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated User data in the firebase fire-store
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture:''
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      SFullScreenLoaders.stopLoading();

      // Show success message
      SLoaders.successSnackBar(title: 'Congratulation!', message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email Screen
      Get.to(()=> VerifyEmailScreen(email: email.text.trim()));

    }catch (e){
      SFullScreenLoaders.stopLoading();

      // Show some Generic error to the user
      SLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}