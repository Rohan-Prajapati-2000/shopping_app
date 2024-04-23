import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:shoping_app/features/shop/controllers/product/product_controller.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/enums.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: SColors.black)),
            ),
            const SizedBox(width: SSizes.spaceBtwItems),

            /// Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text("\$ ${product.price}",
                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString()) const SizedBox(width: SSizes.spaceBtwItems),
            SProductPriceText(
                price: controller.getProductPrice(product), isLarge: true)
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems / 1.5),

        /// Title
        SProductTitleText(title: product.title),
        const SizedBox(height: SSizes.spaceBtwItems / 2),

        /// Stock Status
        Row(
          children: [
            const SProductTitleText(title: 'Status:'),
            const SizedBox(width: SSizes.spaceBtwItems / 2),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            SCircularImage(
                image: product.brand != null ? product.brand!.image : '',
                height: 40,
                width: 90,
                overlayColor: dark ? SColors.white : SColors.black),
            const SizedBox(width: SSizes.spaceBtwItems / 2),
            SBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium)
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems)
      ],
    );
  }
}
