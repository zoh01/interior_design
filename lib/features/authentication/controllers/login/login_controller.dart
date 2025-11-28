import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interior_design/features/personalization/controllers/user_controller.dart';

import '../../../../data/repositories/authentication_repositories.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../../utils/popups/network_manager.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  // @override
  // void onInit() {
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  // }

  @override
  void onInit() {
    super.onInit(); // always call super
    // Use empty string if nothing is saved yet
    email.text = localStorage.read<String>('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read<String>('REMEMBER_ME_PASSWORD') ?? '';
  }


  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog(
          'Logging you in...', ZImages.processing);
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }
      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user Using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      ZFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try{
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Logging you in...', ZImages.processing,);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      ZFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      // Remove Loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}