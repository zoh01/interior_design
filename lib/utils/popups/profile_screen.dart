import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/common/widgets/texts/section_heading.dart';
import 'package:interior_design/features/authentication/screens/home/widgets/shimmer_effect.dart';
import 'package:interior_design/features/authentication/screens/profile_screen/widgets/change_name.dart';
import 'package:interior_design/features/authentication/screens/profile_screen/widgets/profile_menu.dart';
import 'package:interior_design/features/authentication/screens/settings_screen/widgets/circular_image.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      backgroundColor:
          dark ? ZColors.darkerGrey : Colors.white.withOpacity(0.9),
      appBar: ZAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
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
                              width: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                              height: 80,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              const ZSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              /// Heading Profile Info
              ZProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(const ChangeNameScreen()),
              ),
              ZProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              const Divider(
                color: Colors.grey,
              ),

              /// Heading Personal Info
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              const ZSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              ZProfileMenu(
                onPressed: () {},
                title: 'USER ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              ZProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),
              ZProfileMenu(
                  onPressed: () {},
                  title: 'Phone No',
                  value: controller.user.value.phoneNumber),
              ZProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ZProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '27th June, 1999'),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
