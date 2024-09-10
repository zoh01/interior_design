import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/features/personalization/controllers/address_controller.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';
import 'package:interior_design/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          dark ? ZColors.darkerGrey : Colors.white.withOpacity(0.9),
      appBar: const ZAppBar(
        title: Text(
          'Add New Address',
          style: TextStyle(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: controller.name,
                validator: (value) =>
                    ZValidator.validateEmptyText('Name', value),
                cursorColor: dark ? Colors.white : Colors.black,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user),
                    labelText: 'Name',
                    labelStyle:
                        TextStyle(color: dark ? Colors.white : Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: dark ? Colors.white : Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwInputFields,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneNumber,
                validator: ZValidator.validatePhoneNumber,
                cursorColor: dark ? Colors.white : Colors.black,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                    labelStyle:
                        TextStyle(color: dark ? Colors.white : Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: dark ? Colors.white : Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                    controller: controller.street,
                    validator: (value) => ZValidator.validateEmptyText('Street', value),
                    cursorColor: dark ? Colors.white : Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.building_31),
                        labelText: 'Street',
                        labelStyle: TextStyle(
                            color: dark ? Colors.white : Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: dark ? Colors.white : Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  )),
                  const SizedBox(
                    width: ZSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.postalCode,
                      validator: (value) => ZValidator.validateEmptyText('Postal Code', value),
                      cursorColor: dark ? Colors.white : Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.code),
                          labelText: 'Postal Code',
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
                  ),
                ],
              ),
              const SizedBox(
                height: ZSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        controller: controller.city,
                    validator: (value) => ZValidator.validateEmptyText('City', value),
                    cursorColor: dark ? Colors.white : Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.building),
                        labelText: 'City',
                        labelStyle: TextStyle(
                            color: dark ? Colors.white : Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: dark ? Colors.white : Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  )),
                  const SizedBox(
                    width: ZSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        controller: controller.state,
                    validator: (value) => ZValidator.validateEmptyText('State', value),
                    cursorColor: dark ? Colors.white : Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.activity),
                        labelText: 'State',
                        labelStyle: TextStyle(
                            color: dark ? Colors.white : Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: dark ? Colors.white : Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  )),
                ],
              ),
              const SizedBox(
                height: ZSizes.spaceBtwInputFields,
              ),
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: controller.country,
                validator: (value) => ZValidator.validateEmptyText('Country', value),
                cursorColor: dark ? Colors.white : Colors.black,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.global),
                    labelText: 'Country',
                    labelStyle:
                        TextStyle(color: dark ? Colors.white : Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: dark ? Colors.white : Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections * 1.5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addNewAddresses(),
                  child: const Text('Save'),
                ),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwInputFields,
              )
            ],
          ),
        ),
      )),
    );
  }
}
