import 'package:flutter/material.dart';
import 'package:interior_design/utils/constants/sizes.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../utils/constants/image_strings.dart';

class ZProductColor extends StatelessWidget {
  const ZProductColor({
    super.key,
    required this.image,
    required this.text,
    this.backgroundColor = Colors.white,
    this.onPressed,
  });

  final String image, text;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: ZSizes.defaultSpace),
      child: Column(
        children: [
          ZRoundedImage(
            onPressed: onPressed,
            imageUrl: image,
            width: 70,
            height: 70,
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.all(ZSizes.xs),
          ),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
