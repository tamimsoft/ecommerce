import 'package:flutter/material.dart';

import '../../utils/constants/app_sizes.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme inputDecorationLightTheme = const InputDecorationTheme(
    // border: OutlineInputBorder(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.mRadius)),
    ),
  );
}
