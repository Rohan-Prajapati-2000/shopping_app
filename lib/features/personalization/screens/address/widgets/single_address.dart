import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SSingleAddress extends StatelessWidget {
  const SSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return SRoundedContainer(
      padding: EdgeInsets.all(SSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? SColors.primaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? SColors.darkerGrey
              : SColors.grey,
      margin: EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? SColors.light
                      : SColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MR.MIND", maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: SSizes.sm/2),
              Text(
                "+91 7238-073325",maxLines: 5,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.normal)),
              SizedBox(height: SSizes.sm/2),
              Text("C-88, 3rd Floor, Street Number 9, Gamri Extension, Bhajanpura, Delhi-110053",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(height: SSizes.sm/2),
            ],
          )

        ],
      ),
    );
  }
}
