import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../curved_edges/curved_edges_widgets.dart';
import 'circular_container.dart';


class ZPrimaryHeaderContainer extends StatelessWidget {
  const ZPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ZCurvedEdgeWidget(
      child: Container(
        color: ZColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -170,
              child: ZCircularContainer(
                width: ZHelperFunctions.screenWidth(),
                height: ZHelperFunctions.screenHeight() * 0.4,
                padding: 0,
                radius: 400,
                backgroundColor: ZColors.textWhite.withOpacity(0.1),
              ),
            ),
            ZCircularContainer(
              width: ZHelperFunctions.screenWidth(),
              height: ZHelperFunctions.screenHeight() * .25,
              padding: 0,
              radius: 400,
              backgroundColor: ZColors.textWhite.withOpacity(0.1),
            ),
            Positioned(
              bottom: -170,
              child: ZCircularContainer(
                width: ZHelperFunctions.screenWidth(),
                height: ZHelperFunctions.screenHeight() * 0.4,
                padding: 0,
                radius: 400,
                backgroundColor: ZColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}