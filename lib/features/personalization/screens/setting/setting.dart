import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/primary_header_container.dart';
import 'package:shoping_app/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/personalization/screens/address/address.dart';
import 'package:shoping_app/features/personalization/screens/profile/profile.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            SPrimaryHeaderContainer(
                child: Column(
              children: [
                /// AppBar
                SAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Colors.white))),

                /// User Profile Card
                SUserProfileTile(onPressed: () => Get.to(() => ProfileScreen())),
                const SizedBox(height: SSizes.spaceBtwSections),
              ],
            )),

            /// -- Body
            Padding(padding: const EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                /// Account Setting
                const SSectionHeading(title: 'Account Setting', showActionButton: false),
                const SizedBox(height: SSizes.spaceBtwItems/2),
                SSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set shopping delivery address', onTap: ()=> Get.to(()=> UserAddressScreen()),),
                const SSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove to cart and move to checkout'),
                const SSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-Progress or Completed Orders'),
                const SSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                const SSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all discount coupons'),
                const SSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                const SSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounted'),

                /// App Settings
                const SizedBox(height: SSizes.spaceBtwSections),
                const SSectionHeading(title: 'App Setting', showActionButton: false),
                const SizedBox(height: SSizes.spaceBtwItems),
                const SSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload data to your Cloud Firebase'),
                SSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value) {}, activeColor: SColors.primaryColor),
                ),

                SSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all users',
                  trailing: Switch(value: false, onChanged: (value) {}, activeColor: SColors.primaryColor),
                ),

                SSettingsMenuTile(
                    icon: Icons.image,
                    title: 'HD Quality Image',
                    subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: true, onChanged: (value) {}, activeColor: SColors.primaryColor),
                ),

                const SizedBox(height: SSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: (){},
                      child: const Text("Logout")),
                ),
                const SizedBox(height: SSizes.spaceBtwSections*2.5)



              ],
            ),
            )

          ],
        ),
      ),
    );
  }
}
