import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/auth_controller.dart';
import 'package:started_app/app/res/widget/custom_text_form.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({Key? key}) : super(key: key);

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
              CustomTextFormField(
                controller: controller.lastName.value,
                hintText: 'Last Name',
              ),
              CustomTextFormField(
                controller: controller.name.value,
                hintText: 'Name',
              ),
              Obx(() => ElevatedButton(
                  onPressed: controller.mainController.loading.isTrue
                      ? null
                      : () {
                          if (controller.mainController.formKey.currentState!
                              .validate()) {
                            controller.register();
                          }
                        },
                  child: const Text('Register')))
            ],
          ),
        ),
      ),
    );
  }
}
