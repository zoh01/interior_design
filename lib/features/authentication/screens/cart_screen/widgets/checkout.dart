import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/common/images/z_rounded_container.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/common/widgets/success_screen/success_screen.dart';
import 'package:interior_design/common/widgets/texts/section_heading.dart';
import 'package:interior_design/features/authentication/screens/cart_screen/widgets/payment_successful.dart';
import 'package:interior_design/navigation_menu.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'billing_address.dart';
import 'billing_payment.dart';
import 'billing_section.dart';
import 'cart.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});

  List<CartItem> cartList = [
    CartItem(ZImages.drawer, 'Modern Black Drawer', 'Drawer', 999, 1),
    CartItem(ZImages.sofa, 'L-Shaped White Sofa', 'Sofa', 2399, 1),
    CartItem(ZImages.coffeeTable, 'Round Coffee Table', 'Table', 1259, 1),
    CartItem(ZImages.coffeeTable, 'Round Coffee Table', 'Table', 1259, 1),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          dark ? ZColors.darkerGrey : ZColors.grey.withOpacity(0.4),
      appBar: ZAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: ZSizes.defaultSpace,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: dark ? ZColors.darkGrey : Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(ZSizes.defaultSpace),
                child: Column(
                  children: [
                    ZBillingAmountSection(cartList: cartList),
                    const SizedBox(
                      height: ZSizes.spaceBtwSections,
                    ),

                    /// Divider
                    const Divider(),
                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),
                    ZBillingPayment(dark: dark),
                    /// Divider
                    const Divider(),
                    const ZBillingAddress()
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessfulScreen(
                image: ZImages.paymentSuccessful,
                title: 'Payment Successful',
                subTitle: 'Your item will be shipped soon',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: Text(
              "Checkout \$${cartList.length > 1 ? cartList.map<double>((e) => e.quantity * e.price).reduce((
                    value1,
                    value2,
                  ) => value1 + value2) : cartList[0].price * cartList[0].quantity}"),
        ),
      ),
    );
  }
}
