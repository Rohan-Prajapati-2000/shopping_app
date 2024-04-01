import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:shoping_app/utils/constants/enums.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SBrandCard extends StatelessWidget {
   const SBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SRoundedContainer(
        showBorder: showBorder,
        padding:  EdgeInsets.all(SSizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
             Flexible(
              child: SCircularImage(
                isNetworkImage: false,
                image: SImage.clothIcon,
                backgroundColor: Colors.transparent,
                // overlayColor: SHelperFunctions.isDarkMode(context) ? SColors.white : SColors.black,
              ),
            ),
             SizedBox(width: SSizes.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SBrandTitleWithVerifiedIcon(
                      title: 'Nike', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
