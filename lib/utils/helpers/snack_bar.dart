import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static success(message) async {
    Get.rawSnackbar(
      messageText: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.green.shade500,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      borderRadius: 50,
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
    );
  }

  static alert(message) async {
    Get.rawSnackbar(
      messageText: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey.shade500,
      icon: const Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      borderRadius: 50,
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
    );
  }

  static danger(message) async {
    Get.rawSnackbar(
      messageText: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.red.shade500,
      icon: const Icon(
        Icons.close_outlined,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      borderRadius: 50,
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
    );
  }
}
