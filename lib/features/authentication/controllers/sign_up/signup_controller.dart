import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping_app/utils/helpers/network_manager.dart';
import 'package:shoping_app/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  /// Variables
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
      // Start Loading
      // SFullScreenLoaders.openLoadingDialog('We are processing your information...', animation)

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        SFullScreenLoaders.stopLoading();
        return;
      }

      // Form Validation
      if(!signupFormKey.currentState!.validate()){
        SFullScreenLoaders.stopLoading();
        return;
      }

      // Privacy Policy

      // Register User in the FireBase Authentication & save user data in the firebase

      // Save Authenticated User data in the firbase firestore

      // Show success message

      // Move to verify Email Screen



    }catch (e){
      // Show some Generic error to the user
    }finally{
      // Remove Loader
    }
  }
}