import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductImageSlider extends StatelessWidget {
  const SProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return SCurvedEdgeWidget(
      child: Container(
        color: dark ? SColors.darkerGrey : SColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding:
                const EdgeInsets.all(SSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                      image: AssetImage(SImage.shoesIcon),
                      fit: BoxFit.contain,
                    )),
              ),
            ),

            Positioned(
              right: 0,
              bottom: 30,
              left: SSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 8,
                    separatorBuilder: (_, __) => SizedBox(width: SSizes.spaceBtwItems),

                    itemBuilder: (_, index) => SRoundedImage(
                        width: 80,
                        height: 80,
                        imageUrl: SImage.product3,
                        border: Border.all(color: SColors.primaryColor),
                        padding: EdgeInsets.all(SSizes.sm),
                        backgroundColor: dark ? SColors.dark : SColors.white)),
              ),
            ),

            SAppBar(showBackArrow: true,
              actions: [
                SCircularIcon(icon: Iconsax.heart5, color: Colors.red,onPressed: (){})
              ],
            )

          ],
        ),
      ),
    );
  }
}
