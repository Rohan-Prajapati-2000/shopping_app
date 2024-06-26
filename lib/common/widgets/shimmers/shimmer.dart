import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SShimmerEffect extends StatelessWidget {
  const SShimmerEffect({
    Key? key,
    required this.height,
    required this.width,
    this.radius = 15,
    this.color}) : super(key: key);

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? SColors.darkerGrey : SColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}