import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:interior_design/features/authentication/screens/login/login_screen.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/constants/texts.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';
import 'package:interior_design/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              Text(
                ZTextString.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),
              Text(
                ZTextString.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections * 2,
              ),
              Form(
                key: controller.forgetPasswordFormkey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => ZValidator.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: dark ? Colors.white : Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.direct_right),
                      labelText: ZTextString.email,
                      labelStyle: TextStyle(color: dark ? Colors.white : Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: dark ? Colors.white : Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(ZTextString.submit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
