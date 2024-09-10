import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../home/widgets/shimmer_effect.dart';
import 'circular_image.dart';

class ZUserProfileTile extends StatelessWidget {
  const ZUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image =
        networkImage.isNotEmpty ? networkImage : ZImages.zoh;
        return controller.imageUploading.value
            ? const ZShimmerEffect(
          width: 80,
          height: 80,
          radius: 80,
        )
            : ZCircularImage(
          image: image,
          width: 56,
          isNetworkImage: networkImage.isNotEmpty,
          height: 56,
        );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: ZColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: ZColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: ZColors.white,
        ),
      ),
    );
  }
}
