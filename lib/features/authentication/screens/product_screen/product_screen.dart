import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:interior_design/features/authentication/screens/product_screen/widgets/add_to_cart.dart';
import 'package:interior_design/features/authentication/screens/product_screen/widgets/product_app_bar.dart';
import 'package:interior_design/features/authentication/screens/product_screen/widgets/product_info.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                image: ZImages.drawer,
                image1: ZImages.drawer2,
                image2: ZImages.drawer3,
                image3: ZImages.drawer4,
                image4: ZImages.drawer6,
                width: 10,
                height: 3,
                radius: 100,
                fit: BoxFit.fitWidth,
                width2: ZHelperFunctions.screenWidth() * .9,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              ZProduct_info(),
            ],
          ),
        ),
      ),
    );
  }
}


