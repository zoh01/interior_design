import 'package:flutter/material.dart';

import '../../../../../common/images/z_rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class ZBillingPayment extends StatelessWidget {
  const ZBillingPayment({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZSectionHeading(
          textColor: Colors.black,
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Row(
          children: [
            ZRoundedContainer(
              showBorder: false,
              width: 60,
              height: 50,
              backgroundColor: dark ? ZColors.darkGrey : ZColors.white,
              padding: const EdgeInsets.all(ZSizes.sm),
              child: Image(image: AssetImage(ZImages.debitCard), fit: BoxFit.contain,),
            ),
            const SizedBox(width: ZSizes.md,),
            Text('Debit Card', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black),)
          ],
        ),
      ],
    );
  }
}