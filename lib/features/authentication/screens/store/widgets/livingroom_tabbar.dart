import 'package:flutter/material.dart';
import 'package:interior_design/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/product_container.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../home/widgets/item.dart';

class LivingroomTabBar extends StatelessWidget {
  LivingroomTabBar({super.key});

  List<Item> itemList = [
    Item('Tanic Chest Cabinet', ZImages.tanicMid, 459, '12%', () {}),
    Item('Marble Side Table', ZImages.sideTable, 209, '10%', () {}),
    Item('3 Seater Solid Sofa', ZImages.woodFrame, 1899, '16%', () {}),
    Item('1500W Electric Fireplace', ZImages.fireplace, 659, '10%', () {})
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
              /// Sofas
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Sofas',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(
                        imagePath: ZImages.sofagrey,
                        title: 'Sofa',
                        price: 1699,
                      ),
                      ProductContainer(
                          imagePath: ZImages.sofablue,
                          title: 'Sofa',
                          price: 2499),
                      ProductContainer(
                          imagePath: ZImages.velvetSofa,
                          title: 'Sofa',
                          price: 1899)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              /// TV console
              Column(
                children: [
                  ZSectionHeading(
                    title: 'TV Stand',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(
                          imagePath: ZImages.blackConsole,
                          title: 'TV Stand',
                          price: 549),
                      ProductContainer(
                          imagePath: ZImages.goldConsole,
                          title: 'TV Stand',
                          price: 1099),
                      ProductContainer(
                          imagePath: ZImages.retractedConsole,
                          title: 'TV Console',
                          price: 499)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              /// Centre Table
              Column(
                children: [
                  ZSectionHeading(
                    title: 'Coffee Table',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.sm,
                  ),
                  Row(
                    children: [
                      ProductContainer(
                          imagePath: ZImages.multiTable,
                          title: 'Centre Table',
                          price: 1399),
                      ProductContainer(
                          imagePath: ZImages.woodTable,
                          title: 'Centre Table',
                          price: 1699),
                      ProductContainer(
                          imagePath: ZImages.roundTable,
                          title: 'Centre Table',
                          price: 1099),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

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
