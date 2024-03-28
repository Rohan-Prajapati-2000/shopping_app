import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 Product Image Slider
            SProductImageSlider(),

            /// 2 Product Details
            Padding(
              padding: EdgeInsets.only(right: SSizes.defaultSpace, left: SSizes.defaultSpace, bottom: SSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share
                  SRatingAndShare(),
                  /// - Price, Title, Stock & Brand
                  SProductMetaData(),
                  /// - Attributes
                  SProductsAttributes(),
                  /// - Checkout Button
                  /// - Description
                  /// - Reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


