import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import 'cart.dart';

class ZCartDetails extends StatefulWidget {
  const ZCartDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.quantity,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final double price;
  final int quantity;

  @override
  State<ZCartDetails> createState() => _ZCartDetailsState();
}

class _ZCartDetailsState extends State<ZCartDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(ZSizes.md),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: dark ? ZColors.black : ZColors.darkGrey,
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 3,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: dark ? ZColors.darkerGrey : ZColors.grey,
                    offset: const Offset(-2.0, -2.0),
                    blurRadius: 3,
                    spreadRadius: 1.0),
              ],
              borderRadius: BorderRadius.circular(20),
              color: dark ? ZColors.darkGrey : Colors.white),
          child: Row(
            children: [
              ZRoundedImage(
                imageUrl: widget.imagePath,
                width: 85,
                height: 85,
              ),
              const SizedBox(
                width: ZSizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.black),
                  ),
                  Text(
                    widget.subTitle,
                    style: TextStyle(color: Colors.black.withOpacity(0.4)),
                  ),
                  Text(
                    '\$${widget.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.trash,
                    color: Colors.red,
                  )),
              const SizedBox(
                height: ZSizes.sm,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: dark ? Colors.black : Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (quantity != 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(
                          Iconsax.minus,
                          size: 18,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      width: ZSizes.sm,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: ZSizes.sm,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(
                          Iconsax.add,
                          color: Colors.black,
                          size: 18,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
