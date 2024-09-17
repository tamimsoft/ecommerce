import 'package:ecommerce/common/components/buttons/custom_buttons.dart';
import 'package:ecommerce/utils/constants/app_sizes.dart';
import 'package:ecommerce/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../product/models/product_model.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartController controller = CartController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: controller.cartItems.isEmpty
                ? Center(child: Image.asset(ImagePath.emptyCartImage))
                : _buildCartList(context)),
      ),
    );
  }

  Widget _buildCartList(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              Product item = controller.cartItems.elementAt(index);
              return CartItemWidget(
                title: item.title,
                price: item.price,
                quantity: item.quantity,
                image: item.image,
                onQuantityChanged: (newQuantity) => controller.updateItemQuantity(item, newQuantity),
                removeItem: () => controller.removeFromCart(item),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: AppSizes.mVerticalSpace),
          ),
        ),
        SizedBox(height: AppSizes.mVerticalSpace),
        _buildCartFooter(context),
      ],
    );
  }

  Widget _buildCartFooter(BuildContext context) {
    final isLoading = false.obs;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total amount:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${controller.getTotalAmount()}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: AppSizes.sVerticalSpace),
        Obx(
          () => CustomButton.elevatedButton(
            isLoading: isLoading.value,
            onPressed: () {
              isLoading.value = true;
              Future.delayed(const Duration(seconds: 2)).then((_) {
                controller.checkout();
                isLoading.value = false;
              });
            },
            label: 'CHECK OUT',
          ),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
      ],
    );
  }
}
