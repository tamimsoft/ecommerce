import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';


/*-- Custom style for Elevated Button  --*/
class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  // -- Light Theme
  static final light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.mRadius),
      ),
    ),
  );

  // -- Dark Theme
  static final dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.mRadius),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
    ),
  );
}
