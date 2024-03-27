import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/images/verify_email.png"),
                width: SHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              /// Title and Subtitle
              Text(SText.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SSizes.spaceBtwSections),
              Text(SText.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){} ,
                      child: const Text(SText.done))),

              const SizedBox(height: SSizes.spaceBtwItems),

              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: (){} ,
                      child: const Text(SText.resendEmail))),


            ],
          ),
        ),
      ),
    );
  }
}
