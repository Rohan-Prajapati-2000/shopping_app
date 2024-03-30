import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SCartItem extends StatelessWidget {
  const SCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Cart Product Image
        SRoundedImage(
          imageUrl: SImage.product8,
          height: 60,
          width: 60,
          padding: EdgeInsets.all(SSizes.sm),
          backgroundColor: SHelperFunctions.isDarkMode(context) ? SColors.darkerGrey : SColors.light,
        ),
        SizedBox(width: SSizes.spaceBtwItems),

        /// Title, Price and Size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SBrandTitleWithVerifiedIcon(title: 'Nike'),
            Flexible(child: SProductTitleText(title: 'Winter Jacket', maxLine: 1)),

            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '  UK 08', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                )
            )
          ],
        )


      ],
    );
  }
}
