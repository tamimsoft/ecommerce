import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/helpers/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/button_style.dart';
import '../../../../utils/constants/app_sizes.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final double price;
  final int quantity;
  final String image;
  final Function(int) onQuantityChanged;
  final Function() removeItem;

  const CartItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
    required this.onQuantityChanged,
    required this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
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
            imageUrl: image,
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
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _showDeleteDialog(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.sVerticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price * quantity}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: quantity > 1 ? () => onQuantityChanged(quantity - 1) : null,
                          icon: const Icon(Icons.remove),
                          style: MyButtonStyle.iconButtonStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () => onQuantityChanged(quantity + 1),
                          icon: const Icon(Icons.add),
                          style: MyButtonStyle.iconButtonStyle,
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

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to Delete this item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Dismiss the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeItem();
                Navigator.of(context).pop(); // Close the dialog
                AppSnackBar.success('Delete Complete');
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
