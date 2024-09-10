import 'package:flutter/material.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class ZShimmerEffect extends StatelessWidget {
  const ZShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? ZColors.white : ZColors.darkerGrey),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
