import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';
import 'package:shoping_app/utils/logging/logger.dart';

class SOrderListItems extends StatelessWidget {
  const SOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (_,__) => SizedBox(height: SSizes.spaceBtwItems),
      itemBuilder: (_, index) => SRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(SSizes.md),
        backgroundColor: dark ? SColors.dark : SColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// 1- Icon
                Icon(Iconsax.ship),
                SizedBox(width: SSizes.spaceBtwItems / 2),
      
                /// 2- Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prossing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: SColors.primaryColor, fontWeightDelta: 1)),
                      Text('05 May 2000',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                /// 3- Icon Button
                IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_right_34, size: SSizes.md))
              ],
            ),
      
            SizedBox(height: SSizes.spaceBtwItems),
      
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(width: SSizes.spaceBtwItems / 2),
      
                    /// Order Number
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order',
                            style: Theme.of(context).textTheme.labelMedium),
                        Text('#456789',
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    )),
                  ],
                )),
      
                Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: SSizes.spaceBtwItems / 2),
      
                        /// Shopping date
                        Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Shopping Date',
                                    style: Theme.of(context).textTheme.labelMedium),
                                Text('05 May 2000',
                                    style: Theme.of(context).textTheme.titleMedium)
                              ],
                            )),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
