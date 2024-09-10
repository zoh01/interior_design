import 'package:flutter/material.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/features/authentication/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:interior_design/features/authentication/screens/product_review/widgets/rating_star.dart';
import 'package:interior_design/features/authentication/screens/product_review/widgets/user_review_card.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          dark ? ZColors.darkerGrey : Colors.white.withOpacity(0.9),
      appBar: const ZAppBar(
        title: Text(
          'Reviews & Ratings',
          style: TextStyle(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and Review are verified and are from people who use the same type of device that you use.',
                style: TextStyle(color: dark ? Colors.white : Colors.black),
              ),
              const SizedBox(height: ZSizes.spaceBtwItems,),

              /// overall Product Ratings
              const ZOverallProductRating(),
              const ZRatingBarIndicator(rating: 4.5,),
              Text('11,872', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: ZSizes.spaceBtwSections,),
              ZUserReviewCard(text: 'Adebayo Wariz', image: ZImages.zoh,),
              ZUserReviewCard(text: 'Zoh', image: ZImages.zoh,),
            ],
          ),
        ),
      ),
    );
  }
}
