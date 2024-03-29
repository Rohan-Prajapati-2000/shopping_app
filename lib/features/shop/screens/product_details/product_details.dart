import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:shoping_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: SBottomAddToCart(),
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
                  SizedBox(height: SSizes.spaceBtwSections),
                  /// - Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// - Description
                  SSectionHeading(title: "Description", showActionButton: false),
                  SizedBox(height: SSizes.spaceBtwItems),
                  ReadMoreText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an "
                      "unknown printer took a galley of type and scrambled it to make a type specimen book. "
                      "It has survived not only five centuries, but also the leap into electronic typesetting,"
                      " remaining essentially unchanged. It was popularised in the 1960s with the release of "
                      "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing "
                      "software like Aldus PageMaker including versions of Lorem Ipsum",

                    style: TextStyle(fontWeight: FontWeight.normal),
                    trimLines : 3,
                    trimMode : TrimMode.Line,
                    trimCollapsedText : ' Show more',
                    trimExpandedText : ' Show less',
                    moreStyle : TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    lessStyle : TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  Divider(),
                  SizedBox(height: SSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SSectionHeading(title: 'Reviews (199)', showActionButton: false),
                      IconButton(icon: Icon(Iconsax.arrow_right_3), onPressed: () => Get.to(()=> ProductReviewScreen()))
                    ],
                  ),
                  SizedBox(height: SSizes.spaceBtwSections)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


