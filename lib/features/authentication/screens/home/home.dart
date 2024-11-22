import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:interior_design/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/home_searchcontainer.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/item.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/product.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:interior_design/features/authentication/screens/product_screen/product_screen.dart';
import 'package:interior_design/features/authentication/screens/sofa_screen/sofa_screen.dart';
import 'package:interior_design/features/shop/screens/all_products/all_products.dart';
import 'package:interior_design/features/shop/screens/island_light/island_light.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../shop/screens/king_bed/king_bed.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Product> productList = [
    Product('assets/icons/icons8-bathroom-64.png', 'Bathroom', () {},),
    Product('assets/icons/icons8-bedroom-64.png', 'Bedroom', () {},),
    Product('assets/icons/icons8-kitchen-64.png', 'Kitchen', () {},),
    Product('assets/icons/icons8-living-room-64.png', 'Living-room', () {},),
    Product('assets/icons/icons8-romantic-dinnet-64.png', 'Dinning', () {},),
  ];

  List<Item> itemList = [
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
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZColors.darkerGrey : Colors.grey.withOpacity(0.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZPrimaryHeaderContainer(
              child: Padding(
                padding: const EdgeInsets.all(ZSizes.defaultSpace),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ZSizes.spaceBtwItems),
                  child: Column(
                    children: [
                      ZHomeAppBar(dark: dark),
                      const SizedBox(
                        height: ZSizes.spaceBtwSections,
                      ),
                      const ZSearchContainer(text: 'Search Product',),
                      const SizedBox(
                        height: ZSizes.spaceBtwSections,
                      ),
                      Column(
                        children: [
                          const ZSectionHeading(
                            title: 'POPULAR CATEGORIES',
                            showActionButton: false,
                            textColor: Colors.white,
                          ),
                          const SizedBox(
                            height: ZSizes.spaceBtwItems,
                          ),

                          /// Categories
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: productList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: _buildListItem,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: ZPromoSlider(
                image: 'assets/images/banners/bedroom2.jpeg',
                image1: 'assets/images/banners/living_room.jpeg',
                image2: 'assets/images/banners/dinning.jpeg',
                image3: 'assets/images/banners/kitchen2.jpeg',
                image4: 'assets/images/banners/toilet.jpeg',
                width: 20,
                height: 4,
                radius: 400,
                fit: BoxFit.fitWidth,
                width2: ZHelperFunctions.screenWidth() * .8,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: Column(
                children: [
                  ZSectionHeading(
                    title: 'SPECIAL FOR YOU',
                    showActionButton: true,
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () => Get.to(() => ZAllProducts()),
                  ),
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return Padding(
      padding: const EdgeInsets.only(right: ZSizes.spaceBtwItems),
      child: ZVerticalImageText(
        image: product.imagePath,
        title: product.title,
        onTap: product.ontap,
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
