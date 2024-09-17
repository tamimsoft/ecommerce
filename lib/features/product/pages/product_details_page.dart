import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/components/buttons/custom_buttons.dart';
import 'package:ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce/features/product/controllers/product_controller.dart';
import 'package:ecommerce/features/product/models/product_model.dart';
import 'package:ecommerce/features/product/models/rating_model.dart';
import 'package:ecommerce/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme/button_style.dart';
import '../../../utils/constants/app_colors.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({
    super.key,
    required this.item,
  });

  final Product item;
  final ProductController productController = ProductController.instance;
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final Rating rating = item.rating;
    final RxInt quantity = 1.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.secondary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.lVerticalSpace),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              AspectRatio(
                aspectRatio: 16 / 16,
                child: CachedNetworkImage(
                  imageUrl: item.image,
                  height: 100,
                  width: 100,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${item.price}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        rating.rate.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(${rating.count})',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              Text(
                'Category: ${item.category}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: AppSizes.lVerticalSpace * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          quantity.value > 1 ? quantity.value-- : null;
                        },
                        icon: const Icon(Icons.remove),
                        style: MyButtonStyle.iconButtonStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(
                          () => Text(
                            quantity.value.toString(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => quantity.value++,
                        icon: const Icon(Icons.add),
                        style: MyButtonStyle.iconButtonStyle,
                      ),
                    ],
                  ),
                  Obx(
                    () => Text(
                      '\$${item.price * quantity.value}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.mVerticalSpace * 2),
              CustomButton.elevatedButton(
                onPressed: () {
                  item.quantity = quantity.value;
                  cartController.addToCart(item);
                },
                label: 'Add to Cart'.toUpperCase(),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
