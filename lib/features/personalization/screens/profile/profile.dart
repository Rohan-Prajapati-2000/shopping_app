import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/personalization/controllers/user_controller.dart';
import 'package:shoping_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:shoping_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SCircularImage(image: SImage.user, height: 80, width: 80),
                    TextButton(onPressed: (){}, child: Text("Change Profile Picture")),
                  ],
                ),
              ),

              SizedBox(height: SSizes.spaceBtwItems/2),
              Divider(),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Heading Profile Info
              SSectionHeading(title: "Profile Information", showActionButton: false),
              SizedBox(height: SSizes.spaceBtwItems),

              SProfileMenu(title: "Name", value: controller.user.value.fullName, onPressed: ()=> Get.to(()=> const ChangeName())),
              SProfileMenu(title: "Username", value: controller.user.value.userName, onPressed: (){}),

              SizedBox(height: SSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Heading Personal Info
              SSectionHeading(title: "Personal Information", showActionButton: false),
              SizedBox(height: SSizes.spaceBtwItems),

              SProfileMenu(onPressed: (){}, title: "User Id", value: controller.user.value.id),
              SProfileMenu(onPressed: (){}, title: "E-mail", value: controller.user.value.email),
              SProfileMenu(onPressed: (){}, title: "Phone Number", value: controller.user.value.phoneNumber),
              SProfileMenu(onPressed: (){}, title: "Gender", value: "Male"),
              SProfileMenu(onPressed: (){}, title: "Date of Birth", value: "20 Oct 2000"),
              Divider(),
              SizedBox(height: SSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text("Close Account", style: TextStyle(color: Colors.red))),
              )


            ],
          ),
        ),
      ),
    );
  }
}

