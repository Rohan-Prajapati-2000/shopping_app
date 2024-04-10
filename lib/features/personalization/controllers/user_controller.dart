import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoping_app/data/repositories/authentication/authentication_repositories.dart';
import 'package:shoping_app/data/user/user_repository.dart';
import 'package:shoping_app/features/authentication/models/user_model/user_model.dart';
import 'package:shoping_app/features/authentication/screens/login/login.dart';
import 'package:shoping_app/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/network_manager.dart';
import 'package:shoping_app/utils/popups/full_screen_loader.dart';
import 'package:shoping_app/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save User Record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // first update the Rx user and then check if user data is already stored. if not stored new data

      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to first name and last name
          final nameParts =
              UserModel.namePart(userCredentials.user!.displayName ?? '');
          final userName = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          /// Map data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              userName: userName,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          /// Save User Data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(SSizes.md),
        title: 'Delete Account',
        middleText:
            'Are sure you want to delete your account? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ));
  }

  void deleteUserAccount() async {
    try {
      SFullScreenLoaders.openLoadingDialog(
          'Processing', SImage.loadingAnimation);

      /// First Re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Re-Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          SFullScreenLoaders.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          SFullScreenLoaders.stopLoading();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      SFullScreenLoaders.stopLoading();
      SLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re-Authentication before deleting
  Future<void> reAuthenticationEmailAndPasswordUser() async {
    try {
      SFullScreenLoaders.openLoadingDialog(
          'Processing', SImage.loadingAnimation);
      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoaders.stopLoading();
        return;
      }
      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        SFullScreenLoaders.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      SFullScreenLoaders.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      SFullScreenLoaders.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Upload Profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('User/Image/Profile/', image);

        // Upload user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        SLoaders.successSnackBar(title: 'Congratulations',message: "Your Profile Image has been updated!");
      }
    } catch (e) {
      SLoaders.errorSnackBar(
          title: 'Oh Snap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
