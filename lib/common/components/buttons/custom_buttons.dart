import 'package:ecommerce/theme/button_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton {
  CustomButton._();

  static Widget get _circularProgressIndicator {
    return const SizedBox(
      width: 22,
      height: 22,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2.5,
      ),
    );
  }

  static Widget elevatedButton({
    required String label,
    required VoidCallback onPressed,
    bool isButtonEnabled = true,
    bool isLoading = false,
    double width = double.infinity,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: MyButtonStyle.elevatedButtonStyle,
        onPressed: isButtonEnabled ? onPressed : null,
        child: isLoading ? _circularProgressIndicator : Text(label.tr),
      ),
    );
  }

  static Widget outlinedButton({
    required String label,
    required VoidCallback onPressed,
    bool isButtonEnabled = true,
    bool isLoading = false,
    double width = double.infinity,
  }) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: isButtonEnabled ? onPressed : null,
        child: isLoading ? _circularProgressIndicator : Text(label.tr),
      ),
    );
  }
}
