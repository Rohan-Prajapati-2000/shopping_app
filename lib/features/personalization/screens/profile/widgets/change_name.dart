import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/features/personalization/controllers/update_name_controller.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import 'package:shoping_app/utils/validators/validator.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom App bar
      appBar: SAppBar(
        showBackArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'Use real name for verification. This name will appear on several page.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: SSizes.spaceBtwSections),

            /// Text Fields and button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => SValidator.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: SText.firstName,
                        prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwInputField),

                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => SValidator.validateEmptyText('Last Name', value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: SText.lastName,
                        prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                  ],
                )),

            SizedBox(height: SSizes.spaceBtwItems),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
