import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/constants/texts.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';
import 'package:interior_design/utils/validators/validation.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/update_name/udate_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(UpdateNameController());
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
              Text('Change Name', style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              Text(
                ZTextString.changeName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Form(
                key: controller.updateUserNameFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ZSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) => ZValidator.validateEmptyText('First name', value),
                        keyboardType: TextInputType.name,
                        cursorColor: dark ? Colors.white : Colors.black,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.user),
                            labelText: ZTextString.firstName,
                            labelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: dark ? Colors.white : Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0))),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)))),
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwItems,
                      ),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) => ZValidator.validateEmptyText('Last name', value),
                        keyboardType: TextInputType.name,
                        cursorColor: dark ? Colors.white : Colors.black,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.user),
                            labelText: ZTextString.lastName,
                            labelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: dark ? Colors.white : Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0))),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () => controller.updateUserName(),
                  child: const Text(ZTextString.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
