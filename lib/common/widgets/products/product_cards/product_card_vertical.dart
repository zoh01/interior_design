import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/common/images/z_rounded_image.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../images/z_rounded_container.dart';
import '../../icons/z_circular_icon.dart';
import '../../texts/product_title_text.dart';

class ZProductCardVertical extends StatelessWidget {
  const ZProductCardVertical(
      {super.key,
      required this.title,
      required this.image,
      required this.price,
      required this.rate,
      this.onTap,});

  final String title;
  final String image;
  final double price;
  final String rate;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.0,
        padding: const EdgeInsets.all(1),
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
            borderRadius: BorderRadius.circular(ZSizes.productImageRadius),
            color: dark ? ZColors.darkGrey : Colors.grey),
        child: Column(
          children: [
            ZRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ZSizes.sm),
              backgroundColor: Colors.white.withOpacity(0.6),
              child: Stack(
                children: [
                  ZRoundedImage(
                    imageUrl: image,
                    applyImageRadius: true,
                  ),

                  /// Sales tag
                  Positioned(
                    child: ZRoundedContainer(
                      radius: ZSizes.sm,
                      backgroundColor: ZColors.primary.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(
                          horizontal: ZSizes.sm, vertical: ZSizes.xs),
                      child: Text(
                        rate,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: ZCircularIcon(),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),

            /// Details
            Column(
              children: [
                ZProductTitleText(
                  title: title,
                  smallSize: true,
                ),
                const SizedBox(
                  height: ZSizes.spaceBtwItems,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: ZSizes.sm),
                  child: Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ZSizes.cardRadiusMd),
                        bottomRight: Radius.circular(ZSizes.productImageRadius),
                      )),
                  child: const SizedBox(
                    width: ZSizes.iconLg * 1.2,
                    height: ZSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
