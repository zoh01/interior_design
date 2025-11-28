import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:interior_design/features/authentication/screens/onboarding/onboarding.dart';
import 'package:interior_design/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:interior_design/utils/constants/colors.dart';
import 'package:interior_design/utils/theme/theme.dart';

import 'bindings/general_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const SplashScreen(),
      /// Show Loader or Circular progress indicator meanwhile Authentication Repository is deciding to show relevant Screen
      // home: const Scaffold(
      //   backgroundColor: ZColors.primary,
      //   body: Center(
      //     child: CircularProgressIndicator(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
