import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constants/app_sizes.dart';
import 'package:ecommerce/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/components/buttons/custom_buttons.dart';
import '../../product/models/product_model.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = CartController.instance;
    List<Product> checkoutProducts = controller.loadCheckoutProductsFromStorage();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.successIcon,
              height: 150,
            ),
            SizedBox(height: AppSizes.mHeight),
            const Text(
              'Thanks for shopping!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "We have received your order and are getting\nIt ready to be shippea. we will notity you when It's on It's way!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: AppSizes.sHeight),
            const Text(
              "Your order will be delivered bv 10 March 2025",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: AppSizes.mHeight),
            const Divider(),
            SizedBox(height: AppSizes.mHeight),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("You have ordered ${checkoutProducts.length} products"),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: checkoutProducts.length,
                itemBuilder: (context, index) {
                  Product item = checkoutProducts.elementAt(index);
                  return _buildItem(item: item);
                },
                separatorBuilder: (context, index) => SizedBox(height: AppSizes.mVerticalSpace),
              ),
            ),
            SizedBox(height: AppSizes.mHeight),
            CustomButton.elevatedButton(
              onPressed: () {
                Get.offNamed(AppRoutes.home);
              },
              label: 'Buy More'.toUpperCase(),
            ),
            SizedBox(height: AppSizes.lHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required Product item}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.mRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: item.image,
            height: 80,
            width: 80,
            progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 80,
                width: 80,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.sVerticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Qty: ${item.quantity}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
