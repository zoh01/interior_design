import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ZSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: ZSizes.appBarHeight,
      bottom: ZSizes.defaultSpace,
      right: ZSizes.defaultSpace,
      left: ZSizes.defaultSpace
  );
}