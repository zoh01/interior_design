import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/product_container.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../home/widgets/item.dart';

class DinningTabBar extends StatelessWidget {
  DinningTabBar({
    super.key,
  });
  
  List<Item> itemList = [
    Item('Set of 2 Bar Stools', ZImages.blueBar, 299, '18%', () {}),
    Item('Velvet Bar Stool', ZImages.blackVelvet, 279, '13%', () {}),
    Item('Black Sideboard Buffet', ZImages.dolawnBlack, 1399, '11%', () {}),
    Item('Patterned Sideboard', ZImages.buffet, 799, '13%', () {})
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
              /// Dinning Tables
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Dinning Tables',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.dinning2, title: 'Black Table', price: 1099),
                      ProductContainer(imagePath: ZImages.dinning3, title: 'Black Table', price: 899),
                      ProductContainer(imagePath: ZImages.dinning1, title: 'Black Table', price: 999),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              /// Bar Rack
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Wine Rack',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.barRack, title: 'Wine Rack', price: 1259),
                      ProductContainer(imagePath: ZImages.cabinetRack, title: 'Wine Rack', price: 1699),
                      ProductContainer(imagePath: ZImages.indusRack, title: 'Wine Rack', price: 229),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),
              /// Washing Sink
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Washing Sink',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(imagePath: ZImages.basin1, title: 'Ceramic Sink', price: 299),
                      ProductContainer(imagePath: ZImages.basin2, title: 'Ceramic Sink', price: 629),
                      ProductContainer(imagePath: ZImages.basin3, title: 'Ceramic sink', price: 599),
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