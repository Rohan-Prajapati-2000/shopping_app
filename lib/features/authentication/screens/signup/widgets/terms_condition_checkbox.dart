
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class STermsAndCondition extends StatelessWidget {
  const STermsAndCondition({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller =SignupController.instance;
    final dark = SHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(height: 24, width: 24, child: Obx(
                ()=> Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
        )),

        Text.rich(
            TextSpan(children: [
              TextSpan(text: "${SText.iAgreeTo} ", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: "${SText.privacyPolicy} ", style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? SColors.white : SColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? SColors.white : SColors.primaryColor
              )),
              TextSpan(text: 'and ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: SText.termsOfUse, style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? SColors.white : SColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? SColors.white : SColors.primaryColor
              ))
            ])
        )
      ],
    );
  }
}