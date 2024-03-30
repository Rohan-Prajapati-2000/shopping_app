import 'package:flutter/material.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SBillingAmountSection extends StatelessWidget{
  const SBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: TextStyle(fontWeight: FontWeight.normal)),
            Text('\$256', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems/2),


        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: TextStyle(fontWeight: FontWeight.normal)),
            Text('\$6', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems/2),


        /// Total Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Tax', style: TextStyle(fontWeight: FontWeight.normal)),
            Text('\$2', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems/2),


        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: TextStyle(fontWeight: FontWeight.normal)),
            Text('\$256', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems/2),

      ],
    );
  }

}