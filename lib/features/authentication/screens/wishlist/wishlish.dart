import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:interior_design/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:interior_design/utils/constants/sizes.dart';

import '../../../shop/screens/island_light/island_light.dart';
import '../../../shop/screens/king_bed/king_bed.dart';
import '../home/widgets/item.dart';
import '../product_screen/product_screen.dart';
import '../sofa_screen/sofa_screen.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  /// FavList GridView
  List<Item> favList = [
    Item('Modern Black Dresser', 'assets/images/special/drawer.jpeg', 999,
        '25%', () => Get.to(() => const ProductScreen())),
    Item('L-Shaped White Sofa', 'assets/images/special/sofa.jpeg', 2399, '15%',
        () => Get.to(() => const SofaScreen())),
    Item('Geometric Island Light', 'assets/images/special/kitchen_light.jpeg',
        129, '10%', () => Get.to(() => const IslandLight())),
    Item('Upholstered King Bed', 'assets/images/special/bed_frame.jpeg', 1999,
        '23%', () => Get.to(() => const KingBedScreen())),
    Item('Modern Black Dresser', 'assets/images/special/drawer.jpeg', 999,
        '25%', () => Get.to(() => const ProductScreen())),
    Item('L-Shaped White Sofa', 'assets/images/special/sofa.jpeg', 2399, '15%',
            () => Get.to(() => const SofaScreen())),
    Item('Geometric Island Light', 'assets/images/special/kitchen_light.jpeg',
        129, '10%', () => Get.to(() => const IslandLight())),
    Item('Upholstered King Bed', 'assets/images/special/bed_frame.jpeg', 1999,
        '23%', () => Get.to(() => const KingBedScreen())),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(fontSize: ZSizes.defaultSpace),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: ZSizes.sm),
                child: SizedBox(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add))),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: favList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: ZSizes.gridViewSpacing,
                      crossAxisSpacing: ZSizes.gridViewSpacing,
                      mainAxisExtent: 270),
                  itemBuilder: _buildFavItem)
            ],
          ),
        ),
      ),
    );
  }

  /// Widgets of the Favorite Grid
  Widget _buildFavItem(BuildContext context, int index) {
    Item fav = favList[index];
    return ZProductCardVertical(
      title: fav.title,
      image: fav.image,
      price: fav.price,
      rate: fav.rate,
      onTap: fav.ontap,
    );
  }
}
