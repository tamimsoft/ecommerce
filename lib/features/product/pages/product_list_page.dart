import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/product/pages/product_details_page.dart';
import 'package:ecommerce/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/constants/app_sizes.dart';
import '../controllers/product_controller.dart';
import '../models/product_model.dart';
import '../models/rating_model.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final ProductController controller = ProductController.instance;

  @override
  Widget build(BuildContext context) {
    final RxList<Product> items = controller.productList;

    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: items.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => _buildProductItem(items[index]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                ),
              ),
      ),
    );
  }

  Widget _buildProductItem(Product item) {
    final Rating rating = item.rating;
    return InkWell(
      onTap: () => Get.to(ProductDetailsPage(item: item), transition: Transition.zoom),
      borderRadius: BorderRadius.circular(AppSizes.mRadius),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.all(AppSizes.sHorizontalSpace),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.mRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
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
            SizedBox(height: AppSizes.mVerticalSpace),
            Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(height: AppSizes.sVerticalSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${item.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      rating.rate.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
