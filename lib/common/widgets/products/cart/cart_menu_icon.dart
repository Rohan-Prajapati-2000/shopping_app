import 'package:flutter/material.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SCartCounterIcon extends StatelessWidget {
  const SCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark  = SHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: dark ? SColors.white : Colors.black),
            child: Center(
                child: Text(
              '1',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: dark ? SColors.black : SColors.white, fontSizeFactor: 0.8),
            )),
          ),
        )
      ],
    );
  }
}
