import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/brands/brand_card.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/screens/brands/brand_products.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              SSectionHeading(title: "Brands", showActionButton: false),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Brands
              SGridLayout(
                  itemCount: 12,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => SBrandCard(showBorder: true,
                    onTap: ()=> Get.to(()=> BrandProducts()),
                  ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
