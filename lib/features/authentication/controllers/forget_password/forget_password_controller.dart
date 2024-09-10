import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../data/repositories/authentication_repositories.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../../utils/popups/network_manager.dart';
import '../../screens/forget_password/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Processing your request...', ZImages.processing);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {ZFullScreenLoader.stopLoading(); return;}

      // Form Validation
      if (!forgetPasswordFormkey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      ZFullScreenLoader.stopLoading();

      // Show Success Screen
      ZLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Processing your request...', ZImages.processing);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {ZFullScreenLoader.stopLoading(); return;}

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      ZFullScreenLoader.stopLoading();

      // Show Success Screen
      ZLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

    } catch (e) {
      // Remove Loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}