import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
              GButton(icon: Icons.home_outlined, text: 'Home'),
              GButton(icon: Icons.store, text: 'Store'),
              GButton(icon: Icons.shopping_cart, text: 'Cart',),
              GButton(icon: Icons.perm_identity, text: 'Profile',)
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
