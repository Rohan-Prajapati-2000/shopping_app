import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/enums.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductMetaData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and sale price
        Row(
          children: [
            /// Sale Tag
            SRoundedContainer(
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
            SizedBox(width: SSizes.spaceBtwItems),

            /// Price
            Text("\$ 250",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: SSizes.spaceBtwItems),
            SProductPriceText(price: "170", isLarge: true)
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems / 1.5),

        /// Title
        SProductTitleText(title: 'Nike Sports Shoes'),
        SizedBox(height: SSizes.spaceBtwItems / 2),

        /// Stock Status
        Row(
          children: [
            SProductTitleText(title: 'Status:'),
            SizedBox(width: SSizes.spaceBtwItems/2),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            SCircularImage(image: SImage.shoesIcon, height: 30,width: 30, overlayColor: dark ? SColors.white : SColors.black),
            SizedBox(width: SSizes.spaceBtwItems/2),
            const SBrandTitleWithVerifiedIcon(title: "Nike", brandTextSize: TextSizes.medium)
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems)
      ],
    );
  }
}
