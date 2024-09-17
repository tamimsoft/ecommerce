import 'package:get/get.dart';

class BottomNavController extends GetxController {
  static BottomNavController get instance => Get.find();

  // The index of the currently selected tab
  var currentIndex = 0.obs;

  // Change the tab index
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
