import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../data/repositories/authentication_repositories.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../../utils/popups/network_manager.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final isChecked = false.obs;
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// SignUp
  void signup() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog(
          'We are processing your information...', ZImages.processing);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove Loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // remove Loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!isChecked.value) {
        ZLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
          'In order to create account, you have to read and accept the Privacy Policy & Terms of use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      ZFullScreenLoader.stopLoading();

      // Show Success Message
      ZLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created, verify email to continue.');

      // Move to verify Email screen
      Get.to(() => VerifyEmail(email: email.text.trim(),));
    } catch (e) {
      // Remove Loader
      ZFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}