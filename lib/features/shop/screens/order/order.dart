import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/features/shop/screens/order/widgets/order_list.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: SAppBar(title: Text('My Order', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true),
      body: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),

        /// Orders
        child: SOrderListItems(),
      ),
    );
  }

}