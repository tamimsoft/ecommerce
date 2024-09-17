import 'package:ecommerce/utils/local_storage/local_storage.dart';
import 'package:get/get.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helpers/snack_bar.dart';
import '../models/product_model.dart';

class ProductController extends GetxController with ApiService {
  static ProductController get instance => Get.find();

  final LocalStorage localStorage = LocalStorage();

  final isLoading = true.obs;
  final RxList<Product> productList = <Product>[].obs;
  final RxList<Product> myCartList = <Product>[].obs;

  final RxInt quantity = 1.obs;

  @override
  void onInit() async {
    await _getProductList();
    super.onInit();
  }

  ///-- Method to load all product --------------------------------
  Future<void> _getProductList() async {
    final List<dynamic> jsonList = localStorage.getData<List<dynamic>>('productList') ?? [];

    if (jsonList.isNotEmpty) {
      final cashProduct =
          jsonList.map((json) => Product.fromJson(json)).toList(); // Convert JSON list back to List<Product>

      productList(cashProduct);
      isLoading(false);
    } else if (await isConnected()) {
      try {
        productList.value = await fetchProductList();
        List<Map<String, dynamic>> productListJson = productList.map((product) => product.toJson()).toList();
        localStorage.removeData('productList');
        localStorage.saveData('productList', productListJson); // Store the list of products in JSON format
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
