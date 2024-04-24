import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shoping_app/common/widgets/chips/choice_chips.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/common/widgets/texts/product_tile_text.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/controllers/product/variation_controller.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductsAttributes extends StatelessWidget {
  const SProductsAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = SHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          /// -- Selected Attribute Pricing and Description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            SRoundedContainer(
              padding: EdgeInsets.all(SSizes.md),
              backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
              child: Column(
                children: [
                  /// Title Price and Stock Status
                  Row(
                    children: [
                      SSectionHeading(
                          title: 'Variation', showActionButton: false),
                      SizedBox(width: SSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SProductTitleText(
                                  title: 'Price : ', smallSize: true),

                              /// Actual Price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                    '\$ ${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              SizedBox(width: SSizes.spaceBtwItems),

                              /// Sale Price
                              SProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              SProductTitleText(
                                  title: 'Stock : ', smallSize: true),
                              Text(controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  ///Variation Description
                  Obx(
                  ()=> SProductTitleText(
                      title: controller.selectedVariation.value.description ?? 'Description not found',
                      smallSize: true,
                      maxLine: 4,
                    ),
                  )
                ],
              ),
            ),
          SizedBox(height: SSizes.spaceBtwItems),

          /// Attributes
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map((attribute) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SSectionHeading(
                                title: attribute.name ?? '',
                                showActionButton: false),
                            SizedBox(height: SSizes.spaceBtwItems / 2),
                            Wrap(
                                spacing: 8,
                                children:
                                    attribute.values!.map((attributeValue) {
                                  final isSelected = controller
                                          .selectedAttributes[attribute.name] ==
                                      attributeValue;
                                  final available = controller
                                      .getAttributeAvaliabilityInVariation(
                                          product.productVariations!,
                                          attribute.name!)
                                      .contains(attributeValue);

                                  return SChoiceChip(
                                      text: attributeValue,
                                      selected: isSelected,
                                      onSelected: available
                                          ? (selected) {
                                              if (selected && available) {
                                                controller.onAttributeSelected(
                                                    product,
                                                    attribute.name ?? '',
                                                    attributeValue);
                                              }
                                            }
                                          : null);
                                }).toList())
                          ]))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
