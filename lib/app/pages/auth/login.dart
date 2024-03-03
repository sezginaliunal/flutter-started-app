import 'package:started_app/app/res/boxes/height.dart';
import 'package:started_app/app/res/constants/paddings.dart';
import 'package:started_app/app/res/widget/forgot_password.dart';
import 'package:started_app/app/res/widget/auth_button.dart';
import 'package:started_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/auth_controller.dart';
import 'package:started_app/app/res/widget/custom_text_form.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: getPaddingValue(CustomPadding.medium),
            child: Form(
              key: controller.mainController.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                  ),
                  const HeightBoxesItems.heightTen(),
                  Text('Welcome back you have been missed',
                      style: Get.textTheme.titleSmall),
                  const HeightBoxesItems.heightTen(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autoFillHint: AutofillHints.email,
                        obSecureText: false,
                        controller: controller.email.value,
                        hintText: 'Email',
                      ),
                      const HeightBoxesItems.heightFive(),
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        autoFillHint: AutofillHints.password,
                        controller: controller.password.value,
                        hintText: 'Password',
                        obSecureText: true,
                      ),
                      const ForgetPassword(),
                    ],
                  ),
                  const HeightBoxesItems.heightTen(),
                  Obx(() => SizedBox(
                        width: Get.width,
                        child: controller.mainController.loading.isTrue
                            ? const Center(
                                child: CircularProgressIndicator.adaptive())
                            : AuthButton(
                                text: 'Sign in',
                                onPressed:
                                    controller.mainController.loading.isTrue
                                        ? null
                                        : () {
                                            if (controller.mainController
                                                .loginFormKey.currentState!
                                                .validate()) {
                                              controller.login();
                                            }
                                          },
                              ),
                      )),
                  TextButton(
                      onPressed: () => Get.offAllNamed(AppRoutes.REGISTER),
                      child: Text('Register now!',
                          style: Get.textTheme.titleSmall))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
