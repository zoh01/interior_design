import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:interior_design/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/constants/texts.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () => Get.back(),
          color: dark ? Colors.white : Colors.black,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              SignUp_Form(),

              SizedBox(height: ZSizes.spaceBtwItems,),

              ZFormDivider(dividerText: ZTextString.orSignUpWith),

              SizedBox(height: ZSizes.spaceBtwItems,),

              ZSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

