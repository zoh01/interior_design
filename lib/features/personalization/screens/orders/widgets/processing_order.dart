import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/images/z_rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProcessingOrder extends StatelessWidget {
  const ProcessingOrder(
      {super.key,
      required this.title,
      required this.date,
      required this.order,
      required this.shipping,
      this.ontap});

  final String title;
  final String date;
  final String order;
  final String shipping;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return ZRoundedContainer(
      padding: const EdgeInsets.all(ZSizes.md),
      backgroundColor: dark ? ZColors.dark : ZColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.ship),
                  const SizedBox(
                    width: ZSizes.spaceBtwItems / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: ZColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: ontap,
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: ZSizes.iconSm,
                  ))
            ],
          ),
          const SizedBox(
            height: ZSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.tag),
                      const SizedBox(
                        width: ZSizes.spaceBtwItems / 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            order,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: ZSizes.spaceBtwItems / 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            shipping,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
