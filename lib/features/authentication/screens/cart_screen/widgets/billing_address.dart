import 'package:flutter/material.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';


class ZBillingAddress extends StatelessWidget {
  const ZBillingAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}, textColor: Colors.black,),
        Row(
          children: [
            Icon(Icons.person, color: dark ? ZColors.darkerGrey : ZColors.grey, size: 16,),
            const SizedBox(width: ZSizes.spaceBtwItems,),
            Text('Adebayo Wariz', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.black),),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.phone, color: dark ? ZColors.darkerGrey : ZColors.grey, size: 16,),
            const SizedBox(width: ZSizes.spaceBtwItems,),
            Text('+234 702 513 6608', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.black),),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.location_history, color: dark ? ZColors.darkerGrey : ZColors.grey, size: 16,),
            const SizedBox(width: ZSizes.spaceBtwItems,),
            Text('1, Seye Nuga Str, Ashi Bodija, Ibadan.', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.black), softWrap: true,),
          ],
        )
      ],
    );
  }
}