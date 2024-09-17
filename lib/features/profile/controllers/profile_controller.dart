import 'package:ecommerce/features/profile/models/user_model.dart';
import 'package:ecommerce/utils/local_storage/local_storage.dart';
import 'package:get/get.dart';

import '../../../data/services/api_service.dart';

class ProfileController extends GetxController with ApiService {
  static ProfileController get instance => Get.find();

  final LocalStorage _storage = LocalStorage();

  ///-- Method to load user data from local storage --------------------------------
  User getUserInfo() {
    final userJson = _storage.getData('user') ?? '';
    if (userJson.isNotEmpty) {
      return User.fromJson(userJson);
    }
    return User(
      id: 0,
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      gender: '',
      image: '',
      token: '',
      refreshToken: '',
    );
  }
}
