import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(SImage.user1)),
                SizedBox(width: SSizes.spaceBtwItems),
                Text("MR.MIND", style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),

        /// Review
        Row(
          children: [
            SRatingBarIndicator(rating: 4),
            SizedBox(width: SSizes.spaceBtwItems),
            Text('20 Oct 2000', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems),
        ReadMoreText(
          'The user interface of the app is quite simple, I was able to navigate and make purchase seamlessly, Great job!',
          trimLines: 1,
          style: TextStyle(fontWeight: FontWeight.normal),
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SColors.primaryColor),
        ),

        SizedBox(height: SSizes.spaceBtwItems),

        /// Admin Review
        SRoundedContainer(
          backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
          child: Padding(
            padding: EdgeInsets.all(SSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shopping store", style: Theme.of(context).textTheme.titleMedium),
                    Text("21 Oct 2000", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                SizedBox(height: SSizes.spaceBtwItems),

                ReadMoreText(
                  'The user interface of the app is quite simple, I was able to navigate and make purchase seamlessly, Great job!',
                  trimLines: 1,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: SSizes.spaceBtwSections)


      ],
    );
  }

}