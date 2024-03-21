import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/styles/shadows.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductCartVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    /// Container with side padding, color, edges, radius and shadow
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [SShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(SSizes.productImageRadius),
            color: dark ? SColors.darkerGrey : SColors.white),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount tag
            SRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(1),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  SRoundedImage(
                      imageUrl: SImage.product11, applyImageRadius: true),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: SRoundedContainer(
                      radius: SSizes.sm,
                      backgroundColor: SColors.secondaryColor.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          vertical: SSizes.xs, horizontal: SSizes.sm),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black)),
                    ),
                  ),

                  Positioned(
                      top: 0,
                      right: 0,
                      child:
                          SCircularIcon(icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: SSizes.spaceBtwItems/2),

            /// Details ---
            Padding(padding: EdgeInsets.only(left: SSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SProductTileText(title: 'Black & White Nike Air Shoes', smallSize: true),
                    SizedBox(height: SSizes.spaceBtwItems/2),

                    Row(
                      children: [
                        Text("Nike", style: Theme.of(context).textTheme.labelMedium),
                        SizedBox(width: SSizes.sm),
                        Icon(Iconsax.verify5, color: SColors.primaryColor, size: SSizes.iconXs)
                      ],
                    ),
                  ],
                )
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SProductPriceText(price: '35'),

                Container(
                  decoration: BoxDecoration(
                      color: SColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SSizes.cardRadiusMd),
                          bottomRight: Radius.circular(SSizes.productImageRadius)
                      )
                  ),
                  child: SizedBox(
                      width: SSizes.iconLg *1.2,
                      height: SSizes.iconLg *1.2,
                      child: Center(child: IconButton(onPressed: (){}, icon: Icon(Iconsax.add, color: SColors.white)))),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}

