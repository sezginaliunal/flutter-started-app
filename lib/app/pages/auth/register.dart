import 'package:cingo/app/res/boxes/height.dart';
import 'package:cingo/app/res/constants/paddings.dart';
import 'package:cingo/app/res/widget/auth_button.dart';
import 'package:cingo/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cingo/app/controllers/auth_controller.dart';
import 'package:cingo/app/res/widget/custom_text_form.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: getPaddingValue(CustomPadding.medium),
            child: Form(
              key: controller.mainController.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                  ),
                  const HeightBoxesItems.heightTen(),
                  Text('Welcome back to us!', style: Get.textTheme.titleSmall),
                  const HeightBoxesItems.heightTen(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextFormField(
                        controller: controller.email.value,
                        hintText: 'Email',
                        obSecureText: false,
                      ),
                      const HeightBoxesItems.heightFive(),
                      CustomTextFormField(
                        controller: controller.password.value,
                        hintText: 'Password',
                        obSecureText: true,
                      ),
                      const HeightBoxesItems.heightFive(),
                      CustomTextFormField(
                        obSecureText: false,
                        controller: controller.name.value,
                        hintText: 'Name',
                      ),
                      const HeightBoxesItems.heightFive(),
                      CustomTextFormField(
                        obSecureText: false,
                        controller: controller.lastName.value,
                        hintText: 'Last Name',
                      ),
                      const HeightBoxesItems.heightFive(),
                    ],
                  ),
                  const HeightBoxesItems.heightTen(),
                  Obx(() => SizedBox(
                        width: Get.width,
                        child: controller.mainController.loading.isTrue
                            ? const Center(
                                child: CircularProgressIndicator.adaptive())
                            : AuthButton(
                                onPressed:
                                    controller.mainController.loading.isTrue
                                        ? null
                                        : () {
                                            if (controller.mainController
                                                .registerFormKey.currentState!
                                                .validate()) {
                                              controller.register();
                                            }
                                          },
                                text: 'Sign up',
                              ),
                      )),
                  TextButton(
                      onPressed: () => Get.offAllNamed(AppRoutes.LOGIN),
                      child:
                          Text('Login now!', style: Get.textTheme.titleSmall))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
