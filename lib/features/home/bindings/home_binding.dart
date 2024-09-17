import 'package:ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce/features/product/controllers/product_controller.dart';
import 'package:ecommerce/features/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
  }
}
