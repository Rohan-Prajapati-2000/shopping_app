import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/search_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/primary_header_container.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
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
                  SSectionHeading(
                      title: "Popular Categories",
                      showActionButton: false,
                      textColor: SColors.white),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// Categories
                  SHomeCategories()
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: SPromoSlider(banners: [SImage.campus, SImage.zara, SImage.kartik],),
            )
          ],
        ),
      ),
    );
  }
}

