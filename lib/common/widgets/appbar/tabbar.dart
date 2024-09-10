import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utilities.dart';
import '../../../utils/helpers/helper_functions.dart';


class ZTabBar extends StatelessWidget implements PreferredSizeWidget{
  /// If you want to add the background color to tabs, you have to wrap them in material widgets
  /// To do that we need [PreferredSized] Widget and that's why we created custom class.[PreferredSizeWidget]
  const ZTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? ZColors.black : ZColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: ZColors.primary.withOpacity(0.7),
        unselectedLabelColor: ZColors.darkerGrey,
        labelColor: dark ? Colors.white : ZColors.primary.withOpacity(0.7),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ZDeviceUtils.getAppBarHeight());
}