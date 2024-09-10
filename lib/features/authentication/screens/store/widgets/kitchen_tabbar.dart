import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/product_container.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../home/widgets/item.dart';

class KitchenTabBar extends StatelessWidget {
  KitchenTabBar({super.key});

  List<Item> itemList = [
    Item('Blue Kitchen Island', ZImages.blueIsland, 1799, '18%', () {}),
    Item('Jepamdi Concrete Island', ZImages.japandi, 1099, '17%', () {}),
    Item('Black Metal trolley', ZImages.trolley, 329, '10%', () {}),
    Item('White Marble Shelves', ZImages.wheelTrolley, 209, '11%', () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [

              /// Sink
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Sink',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.dropSink, title: 'Drop Sink', price: 359),
                      ProductContainer(imagePath: ZImages.faucetSink, title: 'Faucet Sink', price: 419),
                      ProductContainer(imagePath: ZImages.quartzSink, title: 'Quartz Sink', price: 429),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),

              /// Faucet
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Faucet',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.brassFaucet, title: 'Brass Faucet', price: 189),
                      ProductContainer(imagePath: ZImages.chromeFaucet, title: 'Black Faucet', price: 89),
                      ProductContainer(imagePath: ZImages.roseFaucet, title: 'Gold Faucet', price: 159),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),

              /// Trash Bin
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Trash Bin',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.steelTrash, title: 'Trash Bin', price: 109),
                      ProductContainer(imagePath: ZImages.liftTrash, title: 'Trash Bin', price: 79),
                      ProductContainer(imagePath: ZImages.autoTrash, title: 'Trash Bin', price: 69),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwSections,),

              /// You might like
              Column(
                children: [
                  ZSectionHeading(
                    title: 'You might like',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: itemList.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: ZSizes.gridViewSpacing,
                          crossAxisSpacing: ZSizes.gridViewSpacing,
                          mainAxisExtent: 270),
                      itemBuilder: _buildZohItem)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildZohItem(BuildContext context, int index) {
    Item item = itemList[index];
    return ZProductCardVertical(
      title: item.title,
      image: item.image,
      price: item.price,
      rate: item.rate,
      onTap: item.ontap,
    );
  }
}
