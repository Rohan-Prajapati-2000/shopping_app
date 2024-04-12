import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/styles/shadows.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:shoping_app/features/shop/controllers/product/product_controller.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/features/shop/screens/product_details/product_details.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/enums.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductCartVertical extends StatelessWidget {
  const SProductCartVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = SHelperFunctions.isDarkMode(context);

    /// Container with side padding, color, edges, radius and shadow
    return GestureDetector(
      onTap: ()=> Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [SShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(SSizes.productImageRadius),
            color: dark ? SColors.darkerGrey : SColors.white),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount tag
            SRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(1),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  SRoundedImage(
                      imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: SRoundedContainer(
                      radius: SSizes.sm,
                      backgroundColor: SColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          vertical: SSizes.xs, horizontal: SSizes.sm),
                      child: Text('$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black)),
                    ),
                  ),

                  const Positioned(
                      top: 0,
                      right: 0,
                      child:
                          SCircularIcon(icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwItems/2),

            /// Details ---
            Padding(padding: EdgeInsets.only(left: SSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SProductTitleText(title: product.title, smallSize: true),
                    const SizedBox(height: SSizes.spaceBtwItems/2),
                    SBrandTitleWithVerifiedIcon(title: product.brand!.name),
                  ],
                )
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: SSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),


                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: SSizes.sm),
                        child: SProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: const BoxDecoration(
                      color: SColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SSizes.cardRadiusMd),
                          bottomRight: Radius.circular(SSizes.productImageRadius)
                      )
                  ),
                  child: SizedBox(
                      width: SSizes.iconLg *1.2,
                      height: SSizes.iconLg *1.2,
                      child: Center(child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.add, color: SColors.white)))),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}


