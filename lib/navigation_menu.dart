import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/features/personalization/screens/setting/setting.dart';
import 'package:shoping_app/features/shop/screens/home/home.dart';
import 'package:shoping_app/features/shop/screens/store/store.dart';
import 'package:shoping_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget{
  const NavigationMenu({super.key});



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,

          backgroundColor: dark ? SColors.black : Colors.white,
          indicatorColor: dark ? SColors.white.withOpacity(0.1) : SColors.black.withOpacity(0.5),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screen = [ const HomeScreen() , const StoreScreen() , const FavouriteScreen(), const SettingScreen()];
}
