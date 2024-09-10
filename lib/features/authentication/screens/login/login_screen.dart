
import 'package:flutter/material.dart';
import 'package:interior_design/common/styles/spacing_styles.dart';
import 'package:interior_design/features/authentication/screens/login/widgets/login_form.dart';
import 'package:interior_design/features/authentication/screens/login/widgets/login_header.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/constants/texts.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              ZLoginHeader(),

              /// Form
              ZloginForm(),

              ZFormDivider(dividerText: ZTextString.orSignInWith,),

              SizedBox(height: ZSizes.spaceBtwItems,),

              ZSocialButtons(),

              SizedBox(height: ZSizes.spaceBtwSections,)
            ],
          ),
        ),
      ),
    );
  }
}




