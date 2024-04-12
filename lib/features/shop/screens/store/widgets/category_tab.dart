import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/brands/brand_show_case.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SCategoryTab extends StatelessWidget{
  const SCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const SBrandShowcase(images: [SImage.product1, SImage.product2, SImage.product4]),
              const SBrandShowcase(images: [SImage.product5, SImage.product6, SImage.product7]),

              /// Products
              SSectionHeading(title: "You might like", onPressed: (){}),
              const SizedBox(height: SSizes.spaceBtwItems),

              SGridLayout(itemCount: 4, itemBuilder: (_, index){
                return SProductCartVertical(product: ProductModel.empty());
              })

            ],
          ),
        ),
      ],

    );
  }

}