import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SSortableProducts extends StatelessWidget {
  const SSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {},
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popular']
                .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                .toList()
        ),

        SizedBox(height: SSizes.spaceBtwSections),

        /// Products
        SGridLayout(itemCount: 12, itemBuilder: (_,index)=> SProductCartVertical())
      ],
    );
  }
}
