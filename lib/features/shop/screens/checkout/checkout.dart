import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/products/cart/coupon_widget.dart';
import 'package:shoping_app/common/widgets/success_screen/success_screen.dart';
import 'package:shoping_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shoping_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shoping_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shoping_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shoping_app/navigation_menu.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// items in cart
              SCartItems(showAddRemoveButtons: false),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Coupons TextFields
              SCouponCode(),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Billing Section
              SRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: dark ? Colors.black : Colors.white,
                child: Column(
                  children: [
                    /// Pricing
                    SBillingAmountSection(),
                    SizedBox(height: SSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: SSizes.spaceBtwItems),

                    /// Payment Method
                    SBillingPaymentSection(),
                    SizedBox(height: SSizes.spaceBtwItems),

                    /// Address
                    SBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Successful Payment Screen
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: SImage.successfulpaymentIcon,
              title: 'Payment Success!',
              subtitle: 'Your item will be shipped soon!',
              onPressed: ()=> Get.offAll(()=> NavigationMenu()))),
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}
