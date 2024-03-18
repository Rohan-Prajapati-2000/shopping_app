import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

class SLoginForm extends StatefulWidget {
  const SLoginForm({
    super.key,
  });

  @override
  State<SLoginForm> createState() => _SLoginFormState();
}

class _SLoginFormState extends State<SLoginForm> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: SText.email),
            ),
            SizedBox(height: SSizes.spaceBtwInputField),

            /// Password
            TextFormField(
              obscureText: passwordVisible,
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: SText.password,
                    suffixIcon: IconButton(
                        icon: Icon(passwordVisible ? Iconsax.eye_slash : Iconsax.eye),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        }))),
            SizedBox(height: SSizes.spaceBtwInputField / 2),

            // Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(SText.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(onPressed: () {}, child: Text(SText.forgetPassword)),
              ],
            ),
            SizedBox(height: SSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Text(SText.signIn))),
            SizedBox(height: SSizes.spaceBtwItems),

            /// create account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: Text(SText.createAccount)))
          ],
        ),
      ),
    );
  }
}
