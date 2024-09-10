import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utilities.dart';

class ZSearchContainer extends StatelessWidget {
  const ZSearchContainer({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ZSizes.sm),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        width: ZDeviceUtils.getScreenWidth(context) * 0.8,
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.black.withOpacity(0.5),),
            const SizedBox(width: ZSizes.xs,),
            Expanded(
              child: TextField(
                showCursor: true,
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black.withOpacity(0.6),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                    hintText: text,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
              ),
            ),
            Icon(Icons.mic, color: Colors.black.withOpacity(0.7),)
          ],
        ),
      ),
    );
  }
}