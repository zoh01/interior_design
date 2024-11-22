import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication_repositories.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever verify screen appears & set timer for out redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ZLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
              () => SuccessScreen(
            image: ZImages.emailVerified,
            title: ZTextString.yourAccountCreatedTitle,
            subTitle: ZTextString.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () => SuccessScreen(
          image: ZImages.emailVerified,
          title: ZTextString.yourAccountCreatedTitle,
          subTitle: ZTextString.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}