import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_app/features/authentication/screens/login/login.dart';
import 'package:shoping_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shoping_app/features/authentication/screens/signup/verify_email.dart';
import 'package:shoping_app/navigation_menu.dart';
import 'package:shoping_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:shoping_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoping_app/utils/exceptions/format_exceptions.dart';
import 'package:shoping_app/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    /// remove the native splash screen
    FlutterNativeSplash.remove();

    /// Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user!=null){
      if(user.emailVerified){
        Get.offAll(()=> const NavigationMenu());
      } else{
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen()) // Redirect to Login screen if not the first time
          : Get.offAll(const OnBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
    }
  }

/*----------------------------Email & Password Sign in---------------------------------*/

  /// [EmailAuthentication] - Sign-In
  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const SFormatException();
    } on PlatformException catch (e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again!';
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e){
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw SFormatException();
    } on PlatformException catch (e){
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }



  /// [ReAuthentication] - ReAuthenticate User
  /// [EmailVerification] - Mail Verification
  /// [EmailAuthentication] - Forget Password

/*----------------------------Federated identify & social sign-in---------------------------------*/

  /// [GoogleAuthentication] - GOOGLE
  /// [FacebookAuthentication] - FACEBOOK

/*----------------------------./end Federated identify & social sign-in---------------------------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> LoginScreen());
    } on FirebaseAuthException catch (e){
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw SFormatException();
    } on PlatformException catch (e){
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [DeleteUser] - Remove user Auth and Firestore Account
}
