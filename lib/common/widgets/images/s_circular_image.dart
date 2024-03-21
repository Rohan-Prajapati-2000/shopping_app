import 'package:flutter/material.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.padding = SSizes.sm,
  });


  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (SHelperFunctions.isDarkMode(context) ? SColors.black : SColors.white),
        borderRadius: BorderRadius.circular(500),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
