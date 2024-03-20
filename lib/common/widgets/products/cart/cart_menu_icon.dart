import 'package:flutter/material.dart';
import 'package:shoping_app/utils/constants/colors.dart';

class SCartCounter extends StatelessWidget {
  const SCartCounter({
    super.key, required this.onPressed, required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon:
            Icon(Icons.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black),
            child: Center(child: Text('1', style: Theme.of(context).textTheme.labelLarge!.apply(color: SColors.white, fontSizeFactor: 0.8),)),
          ),
        )
      ],
    );
  }
}