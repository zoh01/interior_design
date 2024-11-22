import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/authentication/screens/forget_password/forget_password.dart';
import 'package:interior_design/features/authentication/screens/signup/signup.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';
import 'package:interior_design/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/login/login_controller.dart';

class ZloginForm extends StatefulWidget {
  const ZloginForm({
    super.key,
  });

  @override
  State<ZloginForm> createState() => _ZloginFormState();
}

class _ZloginFormState extends State<ZloginForm> {
  bool _isSecurePassword = true;
  bool? rememberMe = false;
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
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
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),
            TextFormField(
              controller: controller.password,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            setState(() {
                              controller.rememberMe.value =
                                  !controller.rememberMe.value;
                            });
                          }),
                    ),
                    const SizedBox(
                      width: ZSizes.sm,
                    ),
                    Text(
                      ZTextString.rememberMe,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: dark ? Colors.grey : Colors.black),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: Text(
                      ZTextString.forgetPassword,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? Colors.white : Colors.blueAccent),
                    )),
              ],
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),

            /// Login & SignUp
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(ZTextString.signIn),
              ),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.transparent),
                child: const Text(ZTextString.createAccount),
              ),
            ),
          ],
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
