import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:interior_design/data/repositories/authentication_repositories.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6)).then((zoh) {
      AuthenticationRepository.instance.screenRedirect();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              duration: const Duration(milliseconds: 2000),
              child: Image(
                image: const AssetImage(ZImages.splashImage),
                height: ZHelperFunctions.screenHeight() * .4,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),

            const SizedBox(height: ZSizes.spaceBtwSections),

            FadeInUp(
              duration: const Duration(milliseconds: 2000),
              delay: const Duration(milliseconds: 1000),
              child: Center(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: ZColors.black,
                      fontSize: ZSizes.defaultSpace,
                      fontWeight: FontWeight.bold
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(ZTextString.splashTitle),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
