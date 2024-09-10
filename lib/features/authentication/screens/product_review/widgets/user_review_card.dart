
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/product_review/widgets/rating_star.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/images/z_rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZUserReviewCard extends StatelessWidget {
  const ZUserReviewCard({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ZRoundedContainer(
          backgroundColor: dark ? ZColors.darkGrey : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                  ),
                  const SizedBox(
                    width: ZSizes.spaceBtwItems,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems,
        ),

        /// Reviews
        Row(
          children: [
            const ZRatingBarIndicator(rating: 4.5),
            const SizedBox(
              width: ZSizes.spaceBtwItems,
            ),
            Text(
              '22 Jun, 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems,
        ),

        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great Job! ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrangeAccent),
          lessStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems,
        ),

        /// Company Review
        ZRoundedContainer(
          backgroundColor: dark ? ZColors.black : ZColors.darkGrey,
          child: Padding(
            padding: const EdgeInsets.all(ZSizes.md),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Warizoh",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: ZSizes.spaceBtwItems,
                    ),
                    Text(
                      '22 Jun, 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: ZSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'Zoh, You are blessed, you are a complete human being, you lack nothing, you will be great in life, The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great Job! ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent),
                  lessStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: ZSizes.spaceBtwSections,
        )
      ],
    );
  }
}