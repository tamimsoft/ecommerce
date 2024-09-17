import 'package:ecommerce/data/services/api_service.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/snack_bar.dart';
import '../../home/pages/home_page.dart';
import '../../profile/models/user_model.dart';

class LoginController extends GetxController with ApiService {
  static LoginController get instance => Get.find();
  final LocalStorage _storage = LocalStorage();

  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool obscureText = true.obs;
  final RxBool isButtonEnabled = false.obs;
  final RxBool isLoading = false.obs;

  void validateForm() {
    isButtonEnabled.value = formKey.currentState?.validate() ?? false;
  }

  void login() async {
    isLoading(true);
    final userName = userNameController.text;
    final password = passwordController.text;

    // _storage.saveData('userName', loginId);
    if (await isConnected()) {
      try {
        //userName: emilys
        //password: emilyspass
        User user = await fetchUser(userName: userName, password: password);
        AppSnackBar.success('Successfully!');
        _storage.removeData('user');
        _storage.saveData('user', user.toJson());
        Get.offNamed(AppRoutes.home);
      } catch (e) {
        AppSnackBar.alert('$e');
      } finally {
        isLoading(false);
      }
    } else {
      isLoading(false);
      AppSnackBar.danger('There is no Internet connection');
    }
  }
}
