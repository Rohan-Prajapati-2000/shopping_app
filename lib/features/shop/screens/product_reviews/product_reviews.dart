import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:shoping_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shoping_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget{
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: SAppBar(title: Text("Reviews & Ratings"), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rating and reviews are verified and these ratings from that people who are using this application'),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Overall Product ratings
              SOverallProductRating(),
              SRatingBarIndicator(rating: 4.5),
              Text('12,525', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: SSizes.spaceBtwSections),

              /// User Review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),

    );
  }

}



