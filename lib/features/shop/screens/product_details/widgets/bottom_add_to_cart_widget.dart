import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SBottomAddToCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SSizes.defaultSpace, vertical: SSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark ? SColors.darkerGrey : SColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.cardRadiusLg),
          topRight: Radius.circular(SSizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: SColors.darkGrey,
                height: 40,
                width: 40,
                color: SColors.white,
              ),

              SizedBox(width: SSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: SSizes.spaceBtwItems),

              SCircularIcon(
                  icon: Iconsax.add,
                backgroundColor: SColors.black,
                height: 40,
                width: 40,
                color: SColors.white,
              ),
            ],
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(SSizes.md),
              backgroundColor: SColors.black,
              side: BorderSide(color: SColors.black)
            ),
              onPressed: (){}, child: Text("Add to Cart"))

        ],
      ),
    );
  }

}