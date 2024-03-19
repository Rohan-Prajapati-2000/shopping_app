import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(SText.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: SSizes.spaceBtwItems),
            Text(SText.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: SSizes.spaceBtwSections * 2),

            /// Text Field
            TextFormField(
              decoration: InputDecoration(
                  labelText: SText.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            SizedBox(height: SSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> ResetPassword()), child: Text(SText.submit)))
          ],
        ),
      ),
    );
  }
}
