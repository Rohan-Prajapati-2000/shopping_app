import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SBillingAddressSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        Text('MR.MIND', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: SSizes.spaceBtwItems/2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: SSizes.spaceBtwItems),
            Text('+91 7238073325', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems/2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: SSizes.spaceBtwItems),
            Text('Gamri, North East Delhi - 110053', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
      ],
    );
  }

}