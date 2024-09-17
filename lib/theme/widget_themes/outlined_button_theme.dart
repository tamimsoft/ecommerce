import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

/*-- Custom style for Outlined Button  --*/
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  /// -- Light Theme
  static final light = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.grey,
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.sRadius),
      ),
    ),
  );

  /// -- Dark Theme
  static final dark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.sRadius),
      ),
    ),
  );
}
