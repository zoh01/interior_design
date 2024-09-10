import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/personalization/controllers/address_controller.dart';
import 'package:interior_design/features/shop/models/address_model.dart';

import '../../../../../common/images/z_rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZSingleAddress extends StatelessWidget {
  const ZSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final dark = ZHelperFunctions.isDarkMode(context);
    return Obx( () {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: ZRoundedContainer(
            padding: const EdgeInsets.all(ZSizes.md),
            width: double.infinity,
            showBorder: false,
            backgroundColor: selectedAddress
                ? ZColors.primary.withOpacity(0.5)
                : dark
                ? ZColors.darkGrey
                : Colors.white,
            margin: const EdgeInsets.only(bottom: ZSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress
                        ? dark
                        ? ZColors.light
                        : ZColors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                    ),
                    const SizedBox(
                      height: ZSizes.sm / 2,
                    ),
                    Text(
                      address.formattedPhoneNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      address.toString(),
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
