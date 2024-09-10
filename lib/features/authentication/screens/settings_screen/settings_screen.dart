import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/authentication/screens/profile_screen/profile_screen.dart';
import 'package:interior_design/features/authentication/screens/settings_screen/widgets/menu_tile.dart';
import 'package:interior_design/features/authentication/screens/settings_screen/widgets/user_profile.dart';
import 'package:interior_design/features/personalization/screens/address/address.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/screens/orders/orders.dart';
import '../login/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isSwitched = false;
  bool zoh = false;
  bool olamide = false;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZColors.darkerGrey : Colors.grey.withOpacity(0.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            ZPrimaryHeaderContainer(
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: ZColors.white),
                    ),
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                  ),
                  /// User profile card
                  ZUserProfileTile(onPressed: (() => Get.to(() => const ProfileScreen()))),
                ],
              ),
            ),
            /// Body
            Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const ZSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),

                  ZSettingsMenuTile(
                    onTap: () => Get.to(() => AddressScreen()),
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set Shopping delivery address',
                  ),
                  ZSettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                  ),
                  ZSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and completed Orders',
                    onTap: () => Get.to(() => OrdersScreen()),
                  ),
                  ZSettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                  ),
                  ZSettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                  ),
                  ZSettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  ZSettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                  ),

                  /// App Settings
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  const ZSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  const ZSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'upload Data to your Cloud Firebase'),
                  ZSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: isSwitched, onChanged: (newBool) {setState(() {
                      isSwitched = newBool;
                    });}),
                  ),
                  ZSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: zoh, onChanged: (newZoh) {setState(() {
                      zoh = newZoh;
                    });}),
                  ),
                  ZSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set Image Quality to be seen',
                    trailing: Switch(value: olamide, onChanged: (newWariz) {setState(() {
                      olamide = newWariz;
                    });}),
                  ),

                  /// LogOut Button
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text('Logout'),
                    ),
                  ),

                  const SizedBox(height: ZSizes.spaceBtwSections * 2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
