import 'package:flutter/material.dart';
import 'package:interior_design/utils/constants/colors.dart';

class ZShadowStyle {

  static final verticalProductShadow = BoxShadow(
  color: ZColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: ZColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0,2)
  );
}