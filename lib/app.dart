import 'package:ecommerce/routes/app_pages.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/theme/theme_controller.dart';
import 'package:ecommerce/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final storage = LocalStorage(); // Create a GetStorage instance
    final ThemeController themeController = ThemeController();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      // initialBinding: HomeBinding(),
      // Check if token exists
      initialRoute: storage.getData('user') != null ? AppRoutes.home : AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}
