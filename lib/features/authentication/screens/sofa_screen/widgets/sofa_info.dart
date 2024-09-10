import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../product_review/product_review.dart';
import '../../product_screen/widgets/color.dart';
import '../../product_screen/widgets/product_color.dart';

class ZSofaInfo extends StatelessWidget {
  ZSofaInfo({super.key});

  List<ColorProduct> colorList = [
    ColorProduct(ZImages.sofa, 'Ivory', Colors.white, () {}),
    ColorProduct(ZImages.sofagrey, 'Grey', Colors.grey, () {}),
    ColorProduct(ZImages.sofablue, 'Blue', Colors.blueGrey, () {})
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Container(
      width: ZHelperFunctions.screenWidth(),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ZSizes.defaultSpace),
            topRight: Radius.circular(ZSizes.defaultSpace),
            bottomRight: Radius.circular(ZSizes.defaultSpace),
            bottomLeft: Radius.circular(ZSizes.defaultSpace)
        ),
        color: dark ? ZColors.darkGrey : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'L-Shaped White Sofa',
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black),
            ),
            const SizedBox(
              height: ZSizes.md,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$2399.0', style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.black),),
                const Row(
                  children: [
                    Text('Seller: ', style: TextStyle(color: Colors.black38),),
                    Text('Focus', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
                  ],
                )

              ],
            ),

            const SizedBox(height: ZSizes.spaceBtwItems,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ZColors.primary),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ZSizes.sm * 1.2,
                            vertical: ZSizes.xs),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: ZSizes.md,
                            ),
                            SizedBox(
                              width: ZSizes.xs,
                            ),
                            Text(
                              '4.9',
                              style:
                              TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Reviews (324)',
                      style:
                      TextStyle(color: dark ? Colors.black54 : Colors.grey.shade600, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Center(child: IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_34, color: Colors.black,)))
              ],
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Colors',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: ZSizes.sm,
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: _buildListColor,
                    itemCount: colorList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ZColors.primary,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ZSizes.iconXs,
                        vertical: ZSizes.sm),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: ZSizes.sm,
                ),
                Text(
                  ZTextString.drawerDescription,
                  style:
                  TextStyle(color: dark ? Colors.white : Colors.grey.shade600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListColor(BuildContext context, int index) {
    ColorProduct color = colorList[index];
    return ZProductColor(
      image: color.imagePath,
      text: color.title,
      backgroundColor: color.backgroundColor,
      onPressed: () {},
    );
  }
}
