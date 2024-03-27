import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/form_divider.dart';
import 'package:shoping_app/common/widgets/social_buttons.dart';
import 'package:shoping_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(SText.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: SSizes.spaceBtwSections),

              /// From
              const SSignupForm(),

              const SizedBox(height: SSizes.spaceBtwInputField),

              /// Divider
              const SFormDivider(dividerText: SText.orSignUpWith),

              const SizedBox(height: SSizes.spaceBtwInputField),

              /// Social Button
              const SSocialButtons()

            ],
          ),
        ),
      ),
    );
  }
}
