import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shoping_app/features/shop/screens/checkout/checkout.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineMedium)),
      body: Padding(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: SCartItems(),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace/2),
        child: ElevatedButton(
            onPressed: () => Get.to(()=> CheckoutScreen()), child: Text('Checkout \$ 256')),
      ),
    );
  }
}

