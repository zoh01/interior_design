
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design/features/authentication/screens/product_review/widgets/progress_indicator_and_rating.dart';

class ZOverallProductRating extends StatelessWidget {
  const ZOverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
              '4.7',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          child: Column(
            children: [
              ZRatingProgressIndicator(text: '5', value: 1.0),
              ZRatingProgressIndicator(text: '4', value: 0.8),
              ZRatingProgressIndicator(text: '3', value: 0.6),
              ZRatingProgressIndicator(text: '2', value: 0.4),
              ZRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
