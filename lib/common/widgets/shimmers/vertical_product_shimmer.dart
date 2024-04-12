import 'package:flutter/cupertino.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/shimmers/shimmer.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SVerticalProductShimmer extends StatelessWidget {
  const SVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SGridLayout(
        itemCount: itemCount,
        itemBuilder: (_,__) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SShimmerEffect(height: 180, width: 180),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Text
              SShimmerEffect(height: 15, width: 160),
              SizedBox(height: SSizes.spaceBtwItems/2),
              SShimmerEffect(height: 15, width: 110),
            ],
          ),
        )
    );
  }
}
