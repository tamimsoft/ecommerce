import 'package:ecommerce/features/product/models/product_model.dart';
import 'package:ecommerce/utils/helpers/snack_bar.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/local_storage/local_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final _storage = LocalStorage();

  // A list to hold the cart items
  final RxList<Product> cartItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load cart items from local storage when the controller is initialized
    cartItems.value = loadCartFromStorage();
  }

  // Update the quantity of an item
  // void updateItemQuantity(Product item, int newQuantity) {
  void updateItemQuantity(product, int newQuantity) {
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      // If the product exists, just increase the quantity
      cartItems[index].quantity++;
      cartItems.refresh();
    }
    _saveCartToStorage();
  }

  // Calculate total price of all items in the cart
  double getTotalAmount() {
    return cartItems.fold(0, (total, item) => total + item.getTotalPrice);
  }

  // Add a product to the cart with quantity
  void addToCart(Product product) {
    // Check if the product is already in the cart
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      // If the product exists, just increase the quantity
      cartItems[index].quantity++;
    } else {
      // Otherwise, add it to the cart
      cartItems.add(product);
    }
    _saveCartToStorage();
    AppSnackBar.success('Added to cart!');
  }

  // Remove a product from the cart and save to storage
  void removeFromCart(Product product) {
    cartItems.remove(product);
    _saveCartToStorage();
  }

  // Load the cart list from local storage
  List<Product> loadCartFromStorage() {
    List<dynamic> cartData = _storage.getData('cart') ?? [];
    return cartData.map((item) => Product.fromJson(item)).toList();
  }

  // Save the cart to local storage
  void _saveCartToStorage() {
    List<Map<String, dynamic>> cartData = cartItems.map((item) => item.toJson()).toList();
    _storage.saveData('cart', cartData);
  }

  void checkout() {
    List<Map<String, dynamic>> checkoutProducts = cartItems.map((item) => item.toJson()).toList();
    _storage.saveData('checkout', checkoutProducts);
    cartItems.clear();
    _saveCartToStorage();
    Get.offNamed(AppRoutes.checkout);
  }

  // Load checkoutProducts from local storage
  List<Product> loadCheckoutProductsFromStorage() {
    List<dynamic> checkoutProducts = _storage.getData('checkout') ?? [];
    return checkoutProducts.map((item) => Product.fromJson(item)).toList();
  }
}
