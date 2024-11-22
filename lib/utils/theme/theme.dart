import 'package:flutter/material.dart';
import 'package:interior_design/utils/theme/custom_themes/appbar_theme.dart';
import 'package:interior_design/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:interior_design/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:interior_design/utils/theme/custom_themes/chip_theme.dart';
import 'package:interior_design/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:interior_design/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/elevated_button_theme.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ZTextTheme.lightTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: ZAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ZBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: ZCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: ZChipTheme.lightChipTheme,
    outlinedButtonTheme: ZOutlinedButtonTheme.lightOutlinedButtonTheme,
  );
  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ZTextTheme.darkTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: ZAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: ZBottomSheetTheme.darkThemeSheetTheme,
    checkboxTheme: ZCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: ZChipTheme.darkChipTheme,
    outlinedButtonTheme: ZOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}