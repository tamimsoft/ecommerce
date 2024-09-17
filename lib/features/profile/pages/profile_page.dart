import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/profile/controllers/profile_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constants/app_sizes.dart';
import 'package:ecommerce/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/components/buttons/custom_buttons.dart';
import '../models/user_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    User user = controller.getUserInfo();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSizes.lVerticalSpace),
              SizedBox(height: AppSizes.lVerticalSpace),
              SizedBox(
                height: 150,
                width: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: CachedNetworkImage(
                    imageUrl: user.image,
                    height: 120,
                    width: 120,
                    progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 120,
                        width: 120,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(ImagePath.profileIcon),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              SizedBox(height: AppSizes.lVerticalSpace),
              CustomButton.elevatedButton(
                onPressed: () => Get.offAllNamed(AppRoutes.login),
                label: 'Logout'.toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
