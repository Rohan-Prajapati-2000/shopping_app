import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/search_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/primary_header_container.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/screens/widgets/home_appbar.dart';
import 'package:shoping_app/features/shop/screens/widgets/home_categories.dart';
import 'package:shoping_app/features/shop/screens/widgets/promo_slider.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// This is HEADER in BLUE Parts
            SPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  SHomeAppBar(),
                  SizedBox(height: SSizes.spaceBtwSections),

                  /// SearchBar
                  SSearchContainer(text: "Search in store"),
                  SizedBox(height: SSizes.spaceBtwSections),

                  /// Heading
                  Padding(
                    padding: const EdgeInsets.only(left: SSizes.defaultSpace),
                    child: SSectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        textColor: SColors.white),
                  ),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// Categories
                  Padding(
                    padding: const EdgeInsets.only(left: SSizes.defaultSpace),
                    child: SHomeCategories(),
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  SPromoSlider(
                      banners: [SImage.campus, SImage.zara, SImage.kartik]),
                  SizedBox(height: SSizes.spaceBtwSections),

                  /// Heading
                  SSectionHeading(title: "Popular Products", onPressed: (){},),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// Popular product
                  SGridLayout(itemCount: 10, itemBuilder: (_, index) => SProductCartVertical(),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

