
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utilities.dart';

class ZRatingProgressIndicator extends StatelessWidget {
  const ZRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: ZDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: ZColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(ZColors.primary),
            ),
          ),
        )
      ],
    );
  }
}