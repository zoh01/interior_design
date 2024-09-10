import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ZAddToCart extends StatelessWidget {
  const ZAddToCart({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.currentNumber,
  });

  final Function() onAdd;
  final Function() onRemove;
  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ZSizes.md),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45), color: Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: ZSizes.md),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: onRemove,
                      icon: const Icon(
                        Iconsax.minus,
                        size: 18,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: ZSizes.sm,
                  ),
                  Text(
                    currentNumber.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: ZSizes.sm,
                  ),
                  IconButton(
                      onPressed: onAdd,
                      icon: const Icon(
                        Iconsax.add,
                        color: Colors.white,
                        size: 18,
                      ))
                ],
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: ZColors.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: ZSizes.iconXs),
                child: Row(
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ZSizes.md,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: ZSizes.sm,
                    ),
                    Icon(
                      Iconsax.shopping_cart,
                      size: 25,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
