import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A Utility class for managing a full-screen loading dialog.
class ZFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContent for overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: ZHelperFunctions.isDarkMode(Get.context!)
              ? ZColors.dark
              : ZColors.white,
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Adjust the spacing as needed
                    // ZAnimationLoaderWidget(text: text, animation: animation),
                    const SizedBox(height: 150,),
                    Image(
                      image: AssetImage(
                        ZImages.processing,
                      ),
                      width: ZHelperFunctions.screenWidth() * .8,
                    ),
                    const SizedBox(
                      height: ZSizes.defaultSpace,
                    ),
                    const Text(
                      'Processing your request...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
