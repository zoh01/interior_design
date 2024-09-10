import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/authentication/screens/cart_screen/cart_screen.dart';
import 'package:interior_design/features/authentication/screens/home/home.dart';
import 'package:interior_design/features/authentication/screens/settings_screen/settings_screen.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import 'features/authentication/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = ZHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.buttonRadius),
        child: Obx(
            () => GNav(
            onTabChange: (index) => controller.selectedIndex.value = index,
            selectedIndex: controller.selectedIndex.value,
            backgroundColor: Colors.transparent,
            tabBackgroundColor: Colors.grey,
            gap: ZSizes.sm,
            padding: const EdgeInsets.all(12.0),
            tabs: const [
              GButton(icon: Iconsax.home, text: 'Home'),
              GButton(icon: Iconsax.shop, text: 'Store'),
              GButton(icon: Iconsax.shopping_cart, text: 'Cart',),
              GButton(icon: Iconsax.user, text: 'Profile',)
            ],
          ),
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    StoreScreen(),
    ZCartScreen(),
    const SettingsScreen()
  ];
}
