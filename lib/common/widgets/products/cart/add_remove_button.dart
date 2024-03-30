import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: SSizes.md,
          color: SHelperFunctions.isDarkMode(context) ? SColors.white : SColors.black,
          backgroundColor: SHelperFunctions.isDarkMode(context) ? SColors.darkerGrey : SColors.light,
        ),
        SizedBox(width: SSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: SSizes.spaceBtwItems),

        SCircularIcon(
          icon: Icons.add,
          height: 32,
          width: 32,
          size: SSizes.md,
          color: SColors.white,
          backgroundColor: SColors.primaryColor,
        ),
      ],
    );
  }
}
