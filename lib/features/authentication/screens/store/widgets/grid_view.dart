import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/images/z_rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class StoreGridLayout extends StatelessWidget {
  const StoreGridLayout({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.ontap,
  });

  final String image, title, subTitle;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Row(
        children: [
          Flexible(
            child: ZRoundedContainer(
              padding: const EdgeInsets.all(ZSizes.sm),
              backgroundColor: dark ? ZColors.darkGrey : Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    padding: const EdgeInsets.all(ZSizes.sm),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Image(
                        image: AssetImage(image),
                        color: Colors.black.withOpacity(0.8),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: ZSizes.sm,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subTitle,
                          style: const TextStyle(fontSize: 12, color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
