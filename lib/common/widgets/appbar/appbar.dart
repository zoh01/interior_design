import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/device/device_utilities.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class ZAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZAppBar({super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return AppBar(
      backgroundColor: dark ? ZColors.darkGrey : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBackArrow
          ? IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Iconsax.arrow_left_2),
        color: Colors.black,
      )
          : leadingIcon != null
          ? IconButton(
          onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ZDeviceUtils.getAppBarHeight());
}
