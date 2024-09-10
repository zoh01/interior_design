import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interior_design/data/repositories/user/user_repository.dart';
import 'package:interior_design/features/authentication/screens/profile_screen/profile_screen.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/popups/full_screen_loader.dart';
import 'package:interior_design/utils/popups/loaders.dart';

import '../../../../utils/popups/network_manager.dart';

/// Controller to manage user-related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  /// Fetch user Record
  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('We are updating your information...', ZImages.processing);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Update User's first & last name in the firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      ZFullScreenLoader.stopLoading();

      // Show success Screen
      ZLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      // Move to previous screen
      Get.offAll(() => const ProfileScreen());
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Init user data when Home Screen appears

}