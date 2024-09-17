import 'package:flutter/material.dart';
import '../utils/constants/app_colors.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';

class Themes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    elevatedButtonTheme: TElevatedButtonTheme.light,
    outlinedButtonTheme: TOutlinedButtonTheme.light,

    inputDecorationTheme: TTextFieldTheme.inputDecorationLightTheme,


  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.black12,
    elevatedButtonTheme: TElevatedButtonTheme.dark,
    outlinedButtonTheme: TOutlinedButtonTheme.dark,
    inputDecorationTheme: TTextFieldTheme.inputDecorationLightTheme,
  );
}
