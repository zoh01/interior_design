import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:interior_design/features/shop/controllers/home_controller.dart';
import 'package:interior_design/utils/constants/colors.dart';

import '../../../../../common/images/z_rounded_image.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZPromoSlider extends StatelessWidget {
  const ZPromoSlider({
    super.key,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.width,
    required this.height,
    required this.radius,
    required this.fit,
    required this.width2,
  });

  final String image, image1, image2, image3, image4;
  final double? width, height, width2;
  final double radius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: [
            ZRoundedImage(
              imageUrl: image,
              width: width2,
              fit: fit,
            ),
            ZRoundedImage(
              imageUrl: image1,
              width: width2,
              fit: fit,
            ),
            ZRoundedImage(
              imageUrl: image2,
              width: width2,
              fit: fit,
            ),
            ZRoundedImage(
              imageUrl: image3,
              width: width2,
              fit: fit,
            ),
            ZRoundedImage(
              imageUrl: image4,
              width: width2,
              fit: fit,
            ),
          ],
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 5; i++)
                  ZCircularContainer(
                    width: width,
                    height: height,
                    radius: radius,
                    margin: const EdgeInsets.only(right: 8),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? ZColors.primary
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
