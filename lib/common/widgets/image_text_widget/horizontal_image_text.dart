import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SHorizontalImageText extends StatelessWidget {
  const SHorizontalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SSizes.spaceBtwItems),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(SSizes.sm),
            //   decoration: BoxDecoration(
            //       color:
            //           backgroundColor ?? (dark ? SColors.black : SColors.white),
            //       borderRadius: BorderRadius.circular(56)),
            //   child: Center(
            //     child: Image(
            //         image: AssetImage(image),
            //         fit: BoxFit.cover,
            //         color: dark ? SColors.white : SColors.black),
            //   ),
            // ),

            /// Circular Icon
            SCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              padding: 0,
            ),

            const SizedBox(height: SSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: SColors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
