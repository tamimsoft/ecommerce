import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/components/buttons/custom_buttons.dart';
import '../../../../utils/constants/app_sizes.dart';
import 'widgets/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(AppSizes.lVerticalSpace),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.mHeight),
              Center(child: Image.asset(ImagePath.appLogo, height: 200, width: 200)),
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: AppSizes.mHeight),
              const LoginFormWidget(),
              const Text('User Name: emilys\nPassword: emilyspass'),
              SizedBox(height: AppSizes.mHeight),
              SizedBox(height: AppSizes.mHeight),
              CustomButton.outlinedButton(label: 'SKIP', onPressed: () => Get.offAllNamed(AppRoutes.home))
            ],
          ),
        ),
      ),
    );
  }
}
