import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interior_design/common/widgets/appbar/tabbar.dart';
import 'package:interior_design/common/widgets/texts/section_heading.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/home_searchcontainer.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/bedroom_tabbar.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/dinning_tabbar.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/grid_view.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/kitchen_tabbar.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/livingroom_tabbar.dart';
import 'package:interior_design/features/authentication/screens/store/widgets/material.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  List<MaterialZoh> materialList = [
    MaterialZoh(ZImages.sofa_1, 'Sofa', '149 Products', () {}),
    MaterialZoh(ZImages.light, 'Light', '421 Products', () {}),
    MaterialZoh(ZImages.bed, 'Bed', '200 Products', () {}),
    MaterialZoh(ZImages.console, 'TV Stand', '404 Products', () {})
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor:
            dark ? ZColors.darkerGrey : Colors.grey.withOpacity(0.4),
        appBar: AppBar(
          backgroundColor: dark ? ZColors.darkGrey : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Store',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: dark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 410,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ZSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search Bar
                      const SizedBox(
                        height: ZSizes.spaceBtwItems,
                      ),
                      const ZSearchContainer(
                        text: 'Search in Store',
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwSections,
                      ),

                      /// Featured Products
                      ZSectionHeading(
                        title: 'Featured Products',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwItems,
                      ),
                      GridView.builder(
                          itemCount: materialList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: ZSizes.gridViewSpacing,
                                  crossAxisSpacing: ZSizes.gridViewSpacing,
                                  mainAxisExtent: 70),
                          itemBuilder: _buildListProduct)
                    ],
                  ),
                ),

                /// Tabs
                bottom: const ZTabBar(
                  tabs: [
                    Tab(
                      child: Text('Living-room'),
                    ),
                    Tab(
                      child: Text('Bedroom'),
                    ),
                    Tab(
                      child: Text('Dinning'),
                    ),
                    Tab(
                      child: Text('Kitchen'),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              LivingroomTabBar(),
              BedroomTabBar(),
              DinningTabBar(),
              KitchenTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListProduct(BuildContext context, int index) {
    MaterialZoh zoh = materialList[index];
    return StoreGridLayout(
      image: zoh.image,
      title: zoh.title,
      subTitle: zoh.subTitle,
      ontap: zoh.ontap,
    );
  }
}
