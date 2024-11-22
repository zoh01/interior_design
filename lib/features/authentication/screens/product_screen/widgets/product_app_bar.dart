import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';


class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
                padding: const EdgeInsets.all(ZSizes.md)),
            icon: const Icon(Iconsax.arrow_left_2, color: Colors.black,)),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(ZSizes.md)),
                icon: const Icon(Icons.share, color: Colors.black)),
            const SizedBox(
              width: ZSizes.sm,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite,color: Colors.red)),
          ],
        )
      ],
    );
  }
}