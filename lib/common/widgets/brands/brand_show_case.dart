import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/brands/brand_card.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SBrandShowcase extends StatelessWidget {
  const SBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(
      showBorder: true,
      borderColor: SColors.grey,
      padding: const EdgeInsets.all(SSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Product count
          const SBrandCard(showBorder: false),
          const SizedBox(height: SSizes.spaceBtwItems),

          /// Brand top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImagesWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImagesWidget(String image, context) {
  return Expanded(
      child: SRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(SSizes.md),
        margin: const EdgeInsets.only(right: SSizes.sm),
        backgroundColor:
        SHelperFunctions.isDarkMode(context) ? SColors.darkGrey : SColors.light,
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ));
}
