import 'package:flutter/material.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../features/authentication/screens/home/widgets/product.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ZVerticalImageText extends StatelessWidget {
  const ZVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ZSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(ZSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ?? (dark ? ZColors.black : ZColors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Image(
                  image: AssetImage(image,),
                  fit: BoxFit.cover,
                  color: dark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
