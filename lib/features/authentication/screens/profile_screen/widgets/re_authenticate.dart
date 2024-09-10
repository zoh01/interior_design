import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthenticateScreen extends StatefulWidget {
  const ReAuthenticateScreen({super.key});

  @override
  State<ReAuthenticateScreen> createState() => _ReAuthenticateScreenState();
}

class _ReAuthenticateScreenState extends State<ReAuthenticateScreen> {
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () => Get.back(),
          color: dark ? Colors.white : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                'Re-Authenticate User',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Form(
                key: controller.raAuthFormKey,
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Email
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: (value) => ZValidator.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: dark ? Colors.white : Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.direct_right),
                          labelText: ZTextString.email,
                          labelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: dark ? Colors.white : Colors.black),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)))),
                    ),
                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),
                    /// Password
                    TextFormField(
                        controller: controller.verifyPassword,
                        validator: (value) => ZValidator.validatePassword(value),
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: dark ? Colors.white : Colors.black,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.lock),
                            suffixIcon: togglePassword(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: dark ? Colors.white : Colors.black),
                              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            ),
                            labelText: ZTextString.password,
                            labelStyle:
                            TextStyle(color: dark ? Colors.white : Colors.black),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)))),
                        obscureText: _isSecurePassword,
                      ),

                    const SizedBox(height: ZSizes.spaceBtwSections,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text('Verify'),
                      ),
                    ),
                  ],
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? const Icon(Iconsax.eye)
            : const Icon(Iconsax.eye_slash));
  }
}
