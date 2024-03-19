import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/success_screen/success_screen.dart';
import 'package:shoping_app/features/authentication/screens/login/login.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage("assets/images/verify_email.png"),
                width: SHelperFunctions.screenWidth() * 0.6,
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              /// Title and Subtitle
              Text(SText.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: SSizes.spaceBtwSections),
              Text('mrmind@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              SizedBox(height: SSizes.spaceBtwSections),
              Text(SText.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(
                image: "assets/images/verification_done.png",
                title: SText.yourAccountCreatedTitle,
                subtitle: SText.yourAccountCreatedSubTitle,
                onPressed: ()=> Get.to(()=> LoginScreen()),
              )), child: Text("Continue"))),
              SizedBox(height: SSizes.spaceBtwSections),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: Text(SText.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
