import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/auth/auth_controller.dart';
import 'package:started_app/core/components/text_form_field.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
              onPressed: controller.logout, icon: const Icon(Icons.logout))
        ],
      ),
      body: Form(
        key: controller.loginKey,
        child: ListView(
          children: [
            CustomFormWidget(
                controller: controller.email,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
                autofillHints: const [AutofillHints.email]),
            CustomFormWidget(
                controller: controller.password,
                labelText: 'Password',
                validator: Validators.validatePassword,
                obscureText: true,
                autofillHints: const [AutofillHints.password]),
            ElevatedButton(
                onPressed: controller.login, child: const Text('Giriş yap'))
          ],
        ),
      ),
    );
  }
}
