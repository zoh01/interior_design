import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:interior_design/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:interior_design/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:interior_design/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:interior_design/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:interior_design/utils/constants/image_strings.dart';

import '../../../../utils/constants/texts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
            OnBoardingPage(
              image: ZImages.onBoardingImage4,
              title: ZTextString.onBoardingTitle1,
              subTitle: ZTextString.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: ZImages.onBoardingImage5,
              title: ZTextString.onBoardingTitle2,
              subTitle: ZTextString.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: ZImages.onBoardingImage6,
              title: ZTextString.onBoardingTitle3,
              subTitle: ZTextString.onBoardingSubTitle3,
            ),
          ]),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation smooth page indicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
