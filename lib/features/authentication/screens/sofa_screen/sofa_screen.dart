import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/sofa_screen/widgets/sofa_info.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../home/widgets/promo_slider.dart';
import '../product_screen/widgets/add_to_cart.dart';
import '../product_screen/widgets/product_app_bar.dart';
import '../product_screen/widgets/product_info.dart';

class SofaScreen extends StatefulWidget {
  const SofaScreen({super.key});

  @override
  State<SofaScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<SofaScreen> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: ZAddToCart(currentNumber: currentNumber, onAdd: () {
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
      backgroundColor: dark ? ZColors.darkerGrey : Colors.white.withOpacity(0.9),
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
                image: ZImages.sofa,
                image1: ZImages.sofa1,
                image2: ZImages.sofa2,
                image3: ZImages.sofa3,
                image4: ZImages.sofa4,
                width: 10,
                height: 3,
                radius: 100,
                fit: BoxFit.fitWidth,
                width2: ZHelperFunctions.screenWidth() * .9,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              ZSofaInfo(),
            ],
          ),
        ),
      ),
    );;
  }
}
