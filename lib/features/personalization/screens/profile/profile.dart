import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/effects/shimmer.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/personalization/controllers/user_controller.dart';
import 'package:shoping_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:shoping_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : SImage.user;
                      return controller.imageUploading.value
                          ? const SShimmerEffect(height: 80, width: 80, radius: 80)
                          : SCircularImage(image: image,height: 80,width: 80,isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text("Change Profile Picture")),
                  ],
                ),
              ),

              const SizedBox(height: SSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),

              /// Heading Profile Info
              const SSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: SSizes.spaceBtwItems),

              SProfileMenu(
                  title: "Name",
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              SProfileMenu(
                  title: "Username",
                  value: controller.user.value.userName,
                  onPressed: () {}),

              const SizedBox(height: SSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),

              /// Heading Personal Info
              const SSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: SSizes.spaceBtwItems),

              SProfileMenu(
                  onPressed: () {},
                  title: "User Id",
                  value: controller.user.value.id),
              SProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: controller.user.value.email),
              SProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: controller.user.value.phoneNumber),
              SProfileMenu(onPressed: () {}, title: "Gender", value: "Male"),
              SProfileMenu(
                  onPressed: () {},
                  title: "Date of Birth",
                  value: "20 Oct 2000"),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text("Close Account",
                        style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
