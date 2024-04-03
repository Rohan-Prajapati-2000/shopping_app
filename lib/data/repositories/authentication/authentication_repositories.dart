import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_app/features/authentication/screens/login/login.dart';
import 'package:shoping_app/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show Relevant Screen
  screenRedirect() async{
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(()=> const LoginScreen()) : Get.offAll(const OnBoardingScreen());


  }

  /*----------------------------Email & Password Signin---------------------------------*/

/// [EmailAuthentication] - Sign-In
/// [EmailAuthentication] - Register
/// [ReAuthentication] - ReAuthenticate User
/// [EmailVerification] - Mail Verification
/// [EmailAuthentication] - Forget Password

/*----------------------------Federated identify & social sign-in---------------------------------*/

/// [GoogleAuthentication] - GOOGLE
/// [FacebookAuthentication] - FACEBOOK


/*----------------------------./end Federated identify & social sign-in---------------------------------*/

/// [LogoutUser] - Valid for any authentication.
/// [DeleteUser] - Remove user Auth and Firestore Account






}