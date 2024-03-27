import 'package:flutter/material.dart';
import 'package:shoping_app/common/styles/spacing_styles.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {

  final String image, title, subtitle;
  final VoidCallback onPressed;

  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(image),
                width: SHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              /// Title and Subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SSizes.spaceBtwSections),
              Text(subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(SText.scontinue))),
            ],
          ),
        ),
      ),
    );
  }
}
