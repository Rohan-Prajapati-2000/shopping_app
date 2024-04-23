import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shoping_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:shoping_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shoping_app/utils/constants/enums.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const   ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 Product Image Slider
            SProductImageSlider(product: product),

            /// 2 Product Details
            Padding(
              padding: const EdgeInsets.only(right: SSizes.defaultSpace, left: SSizes.defaultSpace, bottom: SSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share
                  SRatingAndShare(),
                  /// - Price, Title, Stock & Brand
                  SProductMetaData(product: product,),
                  /// - Attributes
                  if(product.productType == ProductType.variable.toString()) SProductsAttributes(product: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: SSizes.spaceBtwSections),
                  /// - Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// - Description
                  SSectionHeading(title: "Description", showActionButton: false),
                  SizedBox(height: SSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    trimLines : 3,
                    trimMode : TrimMode.Line,
                    trimCollapsedText : ' Show more',
                    trimExpandedText : ' Show less',
                    moreStyle : TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    lessStyle : TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: SSizes.spaceBtwSections),
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


