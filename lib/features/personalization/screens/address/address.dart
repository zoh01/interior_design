import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/features/personalization/controllers/address_controller.dart';
import 'package:interior_design/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:interior_design/features/personalization/screens/address/widgets/address_list.dart';
import 'package:interior_design/features/personalization/screens/address/widgets/address_list.dart';
import 'package:interior_design/features/personalization/screens/address/widgets/address_list.dart';
import 'package:interior_design/features/personalization/screens/address/widgets/address_list.dart';
import 'package:interior_design/features/personalization/screens/address/widgets/single_address.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  List<AddressList> addressList = [
    AddressList('Olamide Wariz', '+234 702 513 6608',
        '1, Seye nuga Str, Ashi Bodija, Ibadan', true),
    AddressList('Adebayo Mujeeb', '+234 808 786 8747',
        '1, Seye nuga Str, Ashi Bodija, Ibadan', false),
    AddressList('Adebayo Sobur', '+234 708 187 3388',
        '1, Seye nuga Str, Ashi Bodija, Ibadan', false)
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const ZAppBar(
        title: Text(
          'Addresses',
          style: TextStyle(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      backgroundColor:
          dark ? ZColors.darkerGrey : Colors.white.withOpacity(0.9),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: ZColors.primary,
        child: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: SizedBox(
            height: ZHelperFunctions.screenHeight(),
            child: Obx(
                () => FutureBuilder(
                // Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddresses(),
                  builder: (context, snapshot) {
                    /// Helper Function: Handle Loader, No Record, OR Error Message
                    final response = ZCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot);
                    if (response != null) return response;
                    final addresses = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (context, index) => ZSingleAddress(
                        address: addresses[index],
                        onTap: () => controller.selectAddress(addresses[index]),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
