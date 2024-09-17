import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app_colors.dart';
import '../../cart/pages/cart_page.dart';
import '../../product/pages/product_list_page.dart';
import '../../profile/pages/profile_page.dart';
import '../controllers/bottom_nav_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> pages = [
    ProductListPage(),
    CartPage(),
    ProfilePage(),
  ];
  final Set<String> appBarTitle = {"Home", "My Cart", "Profile"};

  @override
  Widget build(BuildContext context) {
    // Create an instance of BottomNavController
    final BottomNavController bottomNavController = BottomNavController.instance;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(appBarTitle.elementAt(bottomNavController.currentIndex.value))),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.secondary,
      ),
      body: Obx(() {
        // Display the page corresponding to the selected tab
        return pages[bottomNavController.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primary,
          currentIndex: bottomNavController.currentIndex.value,
          onTap: bottomNavController.changeTabIndex,
          // Change tab when tapped
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      }),
    );
  }
}
