import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Sport'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              SRoundedImage(
                  imageUrl: SImage.product9,
                  width: double.infinity,
                  applyImageRadius: true),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Sub-Category
              Column(
                children: [
                  /// Heading
                  SSectionHeading(title: "Sport Product", onPressed: (){}),
                  SizedBox(height: SSizes.spaceBtwItems/2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index)=> SizedBox(width: SSizes.spaceBtwItems),
                      itemBuilder: (context, index) => SProductCardHorizontal(),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
