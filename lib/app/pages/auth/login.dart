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
        child: Form(
          key: controller.mainController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: controller.email.value,
                hintText: 'Email',
              ),
              CustomTextFormField(
                controller: controller.password.value,
                hintText: 'Password',
              ),
              Obx(() => ElevatedButton(
                  onPressed: controller.mainController.loading.isTrue
                      ? null
                      : () {
                          if (controller.mainController.formKey.currentState!
                              .validate()) {
                            controller.login();
                          }
                        },
                  child: const Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
