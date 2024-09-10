import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'cart.dart';


class ZBillingAmountSection extends StatelessWidget {
  const ZBillingAmountSection({
    super.key,
    required this.cartList,
  });

  final List<CartItem> cartList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sub-total',
                style: TextStyle(
                    fontSize: ZSizes.md,
                    fontWeight: FontWeight.bold,
                    color: ZColors.darkerGrey)),
            Text('\$${cartList.length > 1 ? cartList.map<double>((e) => e.quantity * e.price).reduce((value1, value2,) => value1 + value2) : cartList[0].price * cartList[0].quantity}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: ZSizes.md)),
          ],
        ),
        const SizedBox(height: ZSizes.sm,),
        /// Shipping Fee
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee',
                style: TextStyle(
                    fontSize: ZSizes.md,
                    fontWeight: FontWeight.bold,
                    color: ZColors.darkerGrey)),
            Text('\$0.0',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: ZSizes.md)),
          ],
        ),
        const SizedBox(height: ZSizes.sm,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee',
                style: TextStyle(
                    fontSize: ZSizes.md,
                    fontWeight: FontWeight.bold,
                    color: ZColors.darkerGrey)),
            Text('\$0.0',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: ZSizes.md)),
          ],
        ),
        const SizedBox(height: ZSizes.md,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Order Total',
                style: TextStyle(
                    fontSize: ZSizes.md,
                    fontWeight: FontWeight.bold,
                    color: ZColors.black)),
            Text('\$${cartList.length > 1 ? cartList.map<double>((e) => e.quantity * e.price).reduce((value1, value2,) => value1 + value2) : cartList[0].price * cartList[0].quantity}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: ZSizes.md)),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwSections,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)),
          child: TextField(
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: ZSizes.md, vertical: ZSizes.sm),
              filled: true,
              fillColor: ZColors.darkerGrey.withOpacity(0.4),
              labelStyle: const TextStyle(color: Colors.black),
              hintText: 'Enter Promo Code',
              hintStyle: const TextStyle(
                color: ZColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  'Apply',
                  style: TextStyle(
                      color: ZColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: ZSizes.md),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}