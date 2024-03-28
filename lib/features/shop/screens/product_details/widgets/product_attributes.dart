import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/chips/choice_chips.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductsAttributes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing and Description
        SRoundedContainer(
          padding: EdgeInsets.all(SSizes.md),
          backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
          child: Column(
            children: [
              /// Title Price and Stock Status
              Row(
                children: [
                  SSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: SSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SProductTitleText(title: 'Price : ', smallSize: true),

                          /// Actual Price
                          Text('\$ 25',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          SizedBox(width: SSizes.spaceBtwItems),

                          /// Sale Price
                          SProductPriceText(price: '20')
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          SProductTitleText(title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              ///Variation Description
              SProductTitleText(
                title:
                    'This is the Description of the product and it can go to max 4 line.',
                smallSize: true,
                maxLine: 4,
              )
            ],
          ),
        ),
        SizedBox(height: SSizes.spaceBtwItems),

        /// Attributes
        Column(
          children: [
            SSectionHeading(title: "Color"),
            SizedBox(height: SSizes.spaceBtwItems / 2),
            // SChoiceChip()
          ],
        )
      ],
    );
  }
}

