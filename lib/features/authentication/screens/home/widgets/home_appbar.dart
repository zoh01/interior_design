import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/shimmer_effect.dart';
import 'package:interior_design/features/authentication/screens/wishlist/wishlish.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';
import 'package:interior_design/utils/constants/image_strings.dart';

import '../../../../../utils/constants/sizes.dart';

class ZHomeAppBar extends StatelessWidget {
  const ZHomeAppBar({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Hello',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              width: ZSizes.xs,
            ),
            Obx(() {
              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is being called
                return const ZShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.lastName,
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }
            }),
            const SizedBox(width: ZSizes.xs,),
            const Image(
              image: AssetImage(ZImages.excited),
              height: ZSizes.defaultSpace,
              width: ZSizes.defaultSpace,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: dark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
          ),
          child: Stack(alignment: Alignment.center, children: [
            IconButton(
              onPressed: () => Get.to(() => FavoriteScreen()),
              icon: Icon(Icons.favorite_border,
                  size: 26,
                  color: dark
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black.withOpacity(0.7)),
            ),
            // Positioned(
            //   right: 19,
            //   bottom: 6,
            //   child: Container(
            //     width: 7,
            //     height: 7,
            //     decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //         color: Colors.red),
            //   ),
            // ),
          ]),
        ),
      ],
    );
  }
}
