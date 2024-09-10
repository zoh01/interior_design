import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/product_container.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../home/widgets/item.dart';

class BedroomTabBar extends StatelessWidget {
  BedroomTabBar({super.key});
  
  List<Item> itemList = [
    Item('Blue Makeup Vanity Set', ZImages.vanitySet, 899, '13%', () {}),
    Item('Makeup Vanity Set', ZImages.mirrorStool, 999, '16%', () {}),
    Item('Upholstered Bench', ZImages.weaveBench, 239, '10%', () {}),
    Item('Ottoman Bench', ZImages.ottomanBench, 409, '11%', () {})
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
              /// Bed
              Column(
                children: [
                  ZSectionHeading(
                    title: 'King Beds',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.fauxBed, title: 'King Bed', price: 1799),
                      ProductContainer(imagePath: ZImages.getBed, title: 'King Bed', price: 2099),
                      ProductContainer(imagePath: ZImages.wingBed, title: 'King Bed', price: 2699),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),

              /// Wardrobe
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Wardrobe',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.sensorWard, title: 'Wardrobe', price: 2399),
                      ProductContainer(imagePath: ZImages.wideWard, title: 'Wardrobe', price: 1299),
                      ProductContainer(imagePath: ZImages.aroWard, title: 'Wardrobe', price: 999),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),

              /// Drawer
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Drawer',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.wirelessStand, title: 'Drawer', price: 299),
                      ProductContainer(imagePath: ZImages.cylinaStand, title: 'Drawer', price: 219),
                      ProductContainer(imagePath: ZImages.greenStand, title: 'Drawer', price: 209),
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
