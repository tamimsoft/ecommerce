import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';

class MyButtonStyle {
  MyButtonStyle._();


  static ButtonStyle get iconButtonStyle{
    return IconButton.styleFrom(
      side: const BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.mRadius),
      ),
    );
  }

  static ButtonStyle get elevatedButtonStyle{
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(16),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.mRadius),
      ),
    );
  }
}
