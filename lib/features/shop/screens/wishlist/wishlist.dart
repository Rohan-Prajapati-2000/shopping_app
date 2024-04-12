import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/features/shop/screens/home/home.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('Wishlist', style: Theme
            .of(context)
            .textTheme
            .headlineMedium),
        actions: [
          SCircularIcon(
            icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                SGridLayout(itemCount: 8, itemBuilder: (_, index){
                  return  SProductCartVertical(product: ProductModel.empty());
                })
              ],
        ),
      ),
    ),);
  }

}