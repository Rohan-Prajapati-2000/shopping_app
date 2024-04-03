import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/brands/brand_card.dart';
import 'package:shoping_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SAppBar(title: Text('Nike')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              SBrandCard(showBorder: true),
              SizedBox(height: SSizes.spaceBtwSections),

              SSortableProducts(),

            ],
          ),
        ),
      ),
    );
  }
}