import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/product_screen/widgets/add_to_cart.dart';
import 'package:interior_design/features/shop/screens/king_bed/widgets/bed_info.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/home/widgets/promo_slider.dart';
import '../../../authentication/screens/product_screen/widgets/product_app_bar.dart';

class KingBedScreen extends StatefulWidget {
  const KingBedScreen({super.key});

  @override
  State<KingBedScreen> createState() => _KingBedScreenState();
}

class _KingBedScreenState extends State<KingBedScreen> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton:  ZAddToCart(currentNumber: currentNumber, onAdd: () {
        setState(() {
          currentNumber++;
        });
      },
        onRemove: () {
          if (currentNumber != 1) {
            setState(() {
              currentNumber--;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: ProductAppBar(),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              ZPromoSlider(
                image: ZImages.kingBed,
                image1: ZImages.kingBed2,
                image2: ZImages.kingBed3,
                image3: ZImages.kingBed4,
                image4: ZImages.kingBed5,
                width: 10,
                height: 3,
                radius: 100,
                fit: BoxFit.fitWidth,
                width2: ZHelperFunctions.screenWidth() * .9,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              ZBedInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
