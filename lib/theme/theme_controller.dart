import 'package:ecommerce/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final _box = LocalStorage();
  final _key = 'isDarkMode';

  // This method determines the current theme mode
  ThemeMode get theme => loadTheme() ? ThemeMode.dark : ThemeMode.light;

  // Loads the theme from storage, defaulting to light theme
  bool loadTheme() => _box.getData(_key) ?? false;

  // Saves the theme mode to storage
  void saveTheme(bool isDarkMode) => _box.saveData(_key, isDarkMode);

  // Changes the theme using GetX's theme management
  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  // Changes the theme mode (light or dark)
  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  // Toggles the theme mode and saves the new setting
  void toggleTheme() {
    bool isDarkMode = !loadTheme();
    saveTheme(isDarkMode);
    changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
