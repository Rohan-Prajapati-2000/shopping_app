import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/products/cart/add_remove_button.dart';
import 'package:shoping_app/common/widgets/products/cart/cart_item.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SCartItems extends StatelessWidget {
  const SCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          SizedBox(height: SSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          SCartItem(),
          if (showAddRemoveButtons) SizedBox(height: SSizes.spaceBtwItems),

          /// Add remove button with total price
          if (showAddRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add Remove Button
                    SProductQuantityWithAddRemoveButton(),
                  ],
                ),
                SProductPriceText(price: '256'),
              ],
            )
        ],
      ),
    );
  }
}
