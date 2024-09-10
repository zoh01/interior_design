import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../authentication/screens/home/widgets/item.dart';
import '../../../authentication/screens/product_screen/product_screen.dart';
import '../../../authentication/screens/sofa_screen/sofa_screen.dart';
import '../island_light/island_light.dart';
import '../king_bed/king_bed.dart';

class ZAllProducts extends StatelessWidget {
  ZAllProducts({super.key});

  List<Item> itemList = [
    Item('Modern Black Dresser', 'assets/images/special/drawer.jpeg', 999,
        '25%', () => Get.to(() => const ProductScreen())),
    Item('L-Shaped White Sofa', 'assets/images/special/sofa.jpeg', 2399, '15%',
        () => Get.to(() => const SofaScreen())),
    Item('Tanic Chest Cabinet', ZImages.tanicMid, 459, '12%', () {}),
    Item('Marble Side Table', ZImages.sideTable, 209, '10%', () {}),
    Item('Geometric Island Light', 'assets/images/special/kitchen_light.jpeg',
        129, '10%', () => Get.to(() => const IslandLight())),
    Item('Upholstered King Bed', 'assets/images/special/bed_frame.jpeg', 1999,
        '23%', () => Get.to(() => const KingBedScreen())),
    Item('3 Seater Solid Sofa', ZImages.woodFrame, 1899, '16%', () {}),
    Item('1500W Electric Fireplace', ZImages.fireplace, 659, '10%', () {})
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZColors.darkerGrey : Colors.grey.shade200,
      appBar: ZAppBar(
        title: Text(
          'Popular Products',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                  decoration:
                      const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  items: [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity'
                  ]
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                  onChanged: (value) {}),
              const SizedBox(height: ZSizes.spaceBtwSections,),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: itemList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: ZSizes.gridViewSpacing,
                      crossAxisSpacing: ZSizes.gridViewSpacing,
                      mainAxisExtent: 270),
                  itemBuilder: _buildProductItem),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildProductItem(BuildContext context, int index) {
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
