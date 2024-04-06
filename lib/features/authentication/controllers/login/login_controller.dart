import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_app/data/repositories/authentication/authentication_repositories.dart';
import 'package:shoping_app/features/personalization/controllers/user_controller.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/helpers/network_manager.dart';
import 'package:shoping_app/utils/popups/full_screen_loader.dart';
import 'package:shoping_app/utils/popups/loaders.dart';

class LoginController extends GetxController{

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    // Check if remember me is selected and fill email and password
    if(localStorage.read('REMEMBER-ME') == true) {
      rememberMe.value = true;
      email.text = localStorage.read('REMEMBER-ME-EMAIL') ?? '';
      password.text = localStorage.read('REMEMBER-ME-PASSWORD') ?? '';
    }
    super.onInit();
  }

  /// Email and Password Signing
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      SFullScreenLoaders.openLoadingDialog('Loading', SImage.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoaders.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SFullScreenLoaders.stopLoading();
        return;
      }

      // Save email and password if Remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER-ME', true);
        localStorage.write('REMEMBER-ME-EMAIL', email.text.trim());
        localStorage.write('REMEMBER-ME-PASSWORD', password.text.trim());
      }
      // else {
      //   // Clear remember me data if not selected
      //   localStorage.remove('REMEMBER-ME');
      //   localStorage.remove('REMEMBER-ME-EMAIL');
      //   localStorage.remove('REMEMBER-ME-PASSWORD');
      // }

      // Login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      SFullScreenLoaders.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoaders.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async{
    try{
      /// Start Loading
      SFullScreenLoaders.openLoadingDialog('Loading', SImage.loadingAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        SFullScreenLoaders.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      /// save user record
      await userController.saveUserRecord(userCredentials);

      /// Remove the loader
      SFullScreenLoaders.stopLoading();

    } catch (e){
      /// Remove the loader
      SFullScreenLoaders.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}
