import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/features/personalization/controllers/user_controller.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import 'package:shoping_app/utils/validators/validator.dart';

class ReAuthLoginForm extends StatelessWidget{
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: Text('Re-Authenticate User')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: SValidator.validateEmail,
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: SText.email),
                ),
                SizedBox(height: SSizes.spaceBtwInputField),


                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => SValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: SText.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon((controller.hidePassword.value) ? Iconsax.eye_slash : Iconsax.eye),
                      )
                    ),
                  ),
                ),
                SizedBox(height: SSizes.spaceBtwSections),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=> controller.reAuthenticationEmailAndPasswordUser(), child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}