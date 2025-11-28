import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interior_design/data/repositories/authentication_repositories.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep splash screen visible until initialization is complete
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    // Initialize local storage
    await GetStorage.init();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize Authentication repository
    Get.put(AuthenticationRepository());

    // Remove splash screen after initialization
    // FlutterNativeSplash.remove();

    // Run the main app
    runApp(const App());
  } catch (e, stackTrace) {
    // FlutterNativeSplash.remove(); // Remove splash if initialization fails
    debugPrint('⚠️ Initialization error: $e');
    debugPrintStack(stackTrace: stackTrace);
  }
}