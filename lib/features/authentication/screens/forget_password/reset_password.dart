import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:interior_design/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:interior_design/features/authentication/screens/login/login_screen.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/constants/texts.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(ZImages.emailSent),
                width: ZHelperFunctions.screenHeight() * 0.4,
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              Text(
                ZTextString.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              Text(email, style: Theme.of(context).textTheme.labelSmall, textAlign: TextAlign.center,),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              Text(ZTextString.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ZSizes.spaceBtwSections,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const LoginScreen()),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                    ),
                    child: const Text(ZTextString.done),
                  )),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(ZTextString.resendEmail))
            ],
          ),
        ),
      ),
    );
  }
}
