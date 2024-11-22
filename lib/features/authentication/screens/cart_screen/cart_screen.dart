import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/features/authentication/screens/cart_screen/widgets/cart.dart';
import 'package:interior_design/features/authentication/screens/cart_screen/widgets/cart_details.dart';
import 'package:interior_design/features/authentication/screens/cart_screen/widgets/checkout.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

class ZCartScreen extends StatelessWidget {
  ZCartScreen({super.key});

  List<CartItem> cartList = [
    CartItem(ZImages.drawer, 'Modern Black Drawer', 'Drawer', 999, 1),
    CartItem(ZImages.sofa, 'L-Shaped White Sofa', 'Sofa', 2399, 1),
    CartItem(ZImages.coffeeTable, 'Round Coffee Table', 'Table', 1259, 1),
    CartItem(ZImages.coffeeTable, 'Round Coffee Table', 'Table', 1259, 1)
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZColors.darkerGrey : Colors.grey.withOpacity(0.4),
      appBar: const ZAppBar(
        title: Text(
          'My Cart', style: TextStyle(fontSize: ZSizes.defaultSpace, color: Colors.black),
        ),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                height: ZHelperFunctions.screenHeight(),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: _buildCartProduct,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: ZSizes.spaceBtwItems,
                        ),
                    itemCount: cartList.length),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckOutScreen()),
          child: Text(
              "Checkout \$${cartList.length > 1 ? cartList.map<double>((e) => e.quantity * e.price).reduce((
                    value1,
                    value2,
                  ) => value1 + value2) : cartList[0].price * cartList[0].quantity}"),
        ),
      ),
    );
  }

  Widget _buildCartProduct(BuildContext context, int index) {
    CartItem cart = cartList[index];
    return ZCartDetails(
        imagePath: cart.imagePath,
        title: cart.title,
        subTitle: cart.subTitle,
        quantity: cart.quantity,
        price: cart.price);
  }
}
