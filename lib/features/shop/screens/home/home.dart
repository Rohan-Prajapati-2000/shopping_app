import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/search_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/primary_header_container.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoping_app/common/widgets/shimmers/shimmer.dart';
import 'package:shoping_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/controllers/product/product_controller.dart';
import 'package:shoping_app/features/shop/screens/all_products/all_products.dart';
import 'package:shoping_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shoping_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shoping_app/features/shop/screens/product_details/product_details.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// This is HEADER in BLUE Parts
            const SPrimaryHeaderContainer(
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
                    padding: EdgeInsets.only(left: SSizes.defaultSpace),
                    child: SSectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        textColor: SColors.white),
                  ),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(
                        left: SSizes.defaultSpace, bottom: SSizes.defaultSpace),
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
                  const SPromoSlider(),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  /// Heading
                  SSectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => AllProductsScreen()),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  /// Popular product

                  Obx(() {
                    if (controller.isLoading.value)
                      return const SVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }

                    return SGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) =>
                            SProductCartVertical(product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
