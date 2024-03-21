import 'package:flutter/cupertino.dart';
import 'package:shoping_app/utils/constants/colors.dart';

class SShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: SColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: SColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2)
  );
}