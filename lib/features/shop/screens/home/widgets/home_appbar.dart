import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/effects/shimmer.dart';
import 'package:shoping_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shoping_app/features/personalization/controllers/user_controller.dart';
import 'package:shoping_app/features/personalization/screens/profile/profile.dart';
import 'package:shoping_app/features/shop/screens/cart/cart.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

class SHomeAppBar extends StatelessWidget {
  const SHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SText.homeAppBarTitle, style: Theme
              .of(context)
              .textTheme
              .labelMedium!
              .apply(color: SColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              /// Display a shimmer loader while user profile is being loaded
              return const SShimmerEffect(width: 86, height: 15);
            }else{
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: SColors.white));
            }
          }),
        ],
      ),
      actions: [
        SCartCounterIcon(onPressed: () => Get.to(() => CartScreen()),
            iconColor: SColors.white)
      ],
    );
  }
}

