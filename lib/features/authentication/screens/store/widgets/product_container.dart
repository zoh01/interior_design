import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.ontap,
  });

  final String imagePath;
  final String title;
  final double price;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(
                right: ZSizes.sm,
              ),
              padding: const EdgeInsets.all(ZSizes.sm),
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: dark ? ZColors.darkGrey : Colors.white,
              ),
              child: Column(
                children: [
                  ZRoundedImage(
                    imageUrl: imagePath,
                    width: 90,
                    height: 90,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 13, color: Colors.black45),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
