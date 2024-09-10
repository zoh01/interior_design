import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZFormDivider extends StatelessWidget {
  const ZFormDivider({
    super.key, required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(child: Divider(color: dark ? ZColors.darkerGrey: ZColors.grey, thickness: 1, indent: 30, endIndent: 5,)),
        Text(dividerText),
        Flexible(child: Divider(color: dark ? ZColors.darkerGrey: ZColors.grey, thickness: 1, indent: 5, endIndent: 30,)),
      ],
    );
  }
}