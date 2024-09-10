import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interior_design/data/repositories/authentication_repositories.dart';
import 'package:interior_design/features/authentication/screens/login/login_screen.dart';
import 'package:interior_design/features/authentication/screens/profile_screen/widgets/re_authenticate.dart';
import 'package:interior_design/utils/constants/image_strings.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/user/user_model.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/popups/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> raAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();
      // If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to first and last name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');
          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      ZLoaders.warningSnackBar(
        title: 'Data not Saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ZSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ZSizes.lg,
            ),
            child: Text('Delete'),
          )),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blue,
            side: const BorderSide(color: Colors.blue),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: ZSizes.lg),
            child: Text('Cancel'),
          )),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      ZFullScreenLoader.openLoadingDialog('Processing', ZImages.processing);

      /// First re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          ZFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'Password') {
          ZFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateScreen());
        }
      }
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      ZLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// ReAuthenticate Before Deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      ZFullScreenLoader.openLoadingDialog('Processing', ZImages.processing);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove Loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!raAuthFormKey.currentState!.validate()) {
        // remove Loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      ZFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      ZLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Upload Profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Upload User Image Record
        Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        ZLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: 'Something went wrong: $e');
    }
    finally {
      imageUploading.value = false;
    }
  }
}
