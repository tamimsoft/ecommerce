import 'package:ecommerce/features/cart/pages/checkout_page.dart';
import 'package:ecommerce/features/home/bindings/home_binding.dart';
import 'package:ecommerce/features/home/pages/home_page.dart';
import 'package:ecommerce/features/product/bindings/product_binding.dart';
import 'package:ecommerce/features/product/pages/product_list_page.dart';
import 'package:get/get.dart';
import '../features/authentication/bindings/login_binding.dart';
import '../features/authentication/pages/login/login_page.dart';
import '../features/cart/bindings/checkout_binding.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const Checkout(),
      // binding: CheckoutBinding(),
    ),
  ];
}


