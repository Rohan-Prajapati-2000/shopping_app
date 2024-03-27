import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/features/authentication/screens/signup/verify_email.dart';
import 'package:shoping_app/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

class SSignupForm extends StatelessWidget {
  const SSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            /// First Name
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                  labelText: SText.firstName, prefixIcon: Icon(Iconsax.user)),
            )),
            const SizedBox(width: SSizes.spaceBtwInputField),

            /// Second Name
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                  labelText: SText.lastName, prefixIcon: Icon(Iconsax.user)),
            )),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwInputField),

        /// User Name
        TextFormField(
          decoration: const InputDecoration(
              labelText: SText.userName, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: SSizes.spaceBtwInputField),

        /// Email
        TextFormField(
          decoration: const InputDecoration(
              labelText: SText.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: SSizes.spaceBtwInputField),

        /// Phone Number
        TextFormField(
          decoration: const InputDecoration(
              labelText: SText.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: SSizes.spaceBtwInputField),

        /// Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: SText.password,
              prefixIcon: Icon(Iconsax.password_check)),
        ),
        const SizedBox(height: SSizes.spaceBtwInputField),

        /// Terms&Condition Checkbox
        const STermsAndCondition(),

        const SizedBox(height: SSizes.spaceBtwInputField),

        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: const Text(SText.createAccount)))
      ],
    ));
  }
}
