import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/common/widgets/login_signup/form_divider.dart';
import 'package:interior_design/common/widgets/login_signup/social_buttons.dart';
import 'package:interior_design/features/authentication/controllers/signup/signup_controller.dart';
import 'package:interior_design/features/authentication/screens/signup/verify_email.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';
import 'package:interior_design/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class SignUp_Form extends StatefulWidget {
  const SignUp_Form({
    super.key,
  });

  @override
  State<SignUp_Form> createState() => _SignUp_FormState();
}

class _SignUp_FormState extends State<SignUp_Form> {
  bool _isSecurePassword = true;
  bool? isChecked = false;
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Text(
            ZTextString.signUpTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: ZSizes.spaceBtwSections,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      ZValidator.validateEmptyText('first name', value),
                  keyboardType: TextInputType.name,
                  cursorColor: dark ? Colors.white : Colors.black,
                  expands: false,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.user),
                      labelText: ZTextString.firstName,
                      labelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: dark ? Colors.white : Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              const SizedBox(
                width: ZSizes.spaceBtwItems,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      ZValidator.validateEmptyText('last name', value),
                  keyboardType: TextInputType.name,
                  cursorColor: dark ? Colors.white : Colors.black,
                  expands: false,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark ? Colors.white : Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      prefixIcon: const Icon(Iconsax.user),
                      labelText: ZTextString.lastName,
                      labelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ZSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                ZValidator.validateEmptyText('Username', value),
            keyboardType: TextInputType.text,
            cursorColor: dark ? Colors.white : Colors.black,
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user_edit),
                labelText: ZTextString.username,
                labelStyle:
                    TextStyle(color: dark ? Colors.white : Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)))),
          ),
          const SizedBox(
            height: ZSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => ZValidator.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
            cursorColor: dark ? Colors.white : Colors.black,
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct),
                labelText: ZTextString.email,
                labelStyle:
                    TextStyle(color: dark ? Colors.white : Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)))),
          ),
          const SizedBox(
            height: ZSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => ZValidator.validatePhoneNumber(value),
            keyboardType: TextInputType.phone,
            cursorColor: dark ? Colors.white : Colors.black,
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.call),
                labelText: ZTextString.phoneNo,
                labelStyle:
                    TextStyle(color: dark ? Colors.white : Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: const OutlineInputBorder(
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
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: togglePassword(),
              labelText: ZTextString.password,
              labelStyle: TextStyle(color: dark ? Colors.white : Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: dark ? Colors.white : Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ),
            obscureText: _isSecurePassword,
          ),
          const SizedBox(
            height: ZSizes.spaceBtwItems,
          ),

          /// Terms & Condition CheckBox
          Row(
            children: [
              SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: Checkbox(
                      value: controller.isChecked.value,
                      onChanged: (value) {
                        setState(() {
                          controller.isChecked.value = !controller.isChecked.value;
                        });
                      })),
              const SizedBox(
                width: ZSizes.spaceBtwItems,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${ZTextString.iAgreeTo} ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: dark ? Colors.grey : Colors.black),
                    ),
                    TextSpan(
                      text: '${ZTextString.privacyPolicy} ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? ZColors.white : ZColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? ZColors.white : ZColors.primary),
                    ),
                    TextSpan(
                        text: '${ZTextString.and} ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: dark ? Colors.grey : Colors.black)),
                    TextSpan(
                      text: ZTextString.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? ZColors.white : ZColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? ZColors.white : ZColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ZSizes.spaceBtwSections,
          ),

          /// SignUp Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () => controller.signup(),
                  child: const Text(ZTextString.createAccount))),
        ],
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
