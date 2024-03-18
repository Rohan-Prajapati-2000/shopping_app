import 'package:flutter/material.dart';
import 'package:shoping_app/common/styles/spacing_styles.dart';
import 'package:shoping_app/common/widgets/form_divider.dart';
import 'package:shoping_app/common/widgets/social_buttons.dart';
import 'package:shoping_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shoping_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo title & subtitle
              SLoginHeader(),

              /// Form
              SLoginForm(),

              /// Divider
              SFormDivider(dividerText: SText.orSignInWith),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Footer
              SSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}