
import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

class SHomeAppBar extends StatelessWidget {
  const SHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SText.homeAppBarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: SColors.grey)),
          Text(SText.homeAppBarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: SColors.white)),
        ],
      ),
      actions: [
        SCartCounter(onPressed: (){}, iconColor: SColors.white)
      ],
    );
  }
}