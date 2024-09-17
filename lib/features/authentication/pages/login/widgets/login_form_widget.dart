import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/components/buttons/custom_buttons.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../controllers/login_controller.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.formKey,
      onChanged: controller.validateForm,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.mVerticalSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- input login id
            TextFormField(
              controller: controller.userNameController,
              validator: (value) {
                if (value!.isEmpty) return 'Username cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your user name',
                prefixIcon: Icon(Icons.person_2_outlined),
              ),
            ),

            ///-- input password
            SizedBox(height: AppSizes.mHeight),
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                validator: (value) {
                  if (value!.isEmpty) return 'Password cannot be empty';
                  return null;
                },
                obscureText: controller.obscureText.value,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureText.value ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      controller.obscureText.value = !controller.obscureText.value;
                    },
                  ),
                ),
              ),
            ),

            /// -- Login Button --
            SizedBox(height: AppSizes.lHeight),
            Obx(
              () => CustomButton.elevatedButton(
                isLoading: controller.isLoading.value,
                isButtonEnabled: controller.isButtonEnabled.value,
                label: 'login'.toUpperCase(),
                onPressed: () {
                  controller.login();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
