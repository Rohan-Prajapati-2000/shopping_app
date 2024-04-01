import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductCardHorizontal extends StatelessWidget {
  const SProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Container(
      width: 320,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color: dark ? SColors.darkerGrey : SColors.softGrey),
      child: Row(
        children: [
          /// Thumbnail
          SRoundedContainer(
              height: 120,
              padding: EdgeInsets.all(SSizes.sm),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  SizedBox(
                      height: 120,
                      width: 120,
                      child: SRoundedImage(
                          imageUrl: SImage.product12, applyImageRadius: true)),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: SRoundedContainer(
                      radius: SSizes.sm,
                      backgroundColor: SColors.secondaryColor.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: SSizes.sm, vertical: SSizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: SColors.black)),
                    ),
                  ),

                  Positioned(
                      top: 0,
                      right: 0,
                      child: SCircularIcon(
                          icon: Iconsax.heart5, color: Colors.red))
                ],
              )),

          /// Details
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.only(top: SSizes.sm, left: SSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SProductTitleText(title: 'Red Nike Shoes with light weight and compatible and flexible', smallSize: true),
                      SizedBox(height: SSizes.spaceBtwItems/2),
                      SBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      Flexible(child: SProductPriceText(price: '256')),

                      /// Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: SColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SSizes.cardRadiusMd),
                            bottomRight: Radius.circular(SSizes.cardRadiusMd),
                          )
                        ),
                        child: SizedBox(
                          width: SSizes.iconLg*1.2,
                          height: SSizes.iconLg*1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: SColors.white),
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
