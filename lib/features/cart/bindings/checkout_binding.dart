import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
   // Get.lazyPut(() => CartController());
  }
}
