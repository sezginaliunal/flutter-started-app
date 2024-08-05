import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/auth/auth_controller.dart';
import 'package:started_app/core/components/text_form_field.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: controller.registerKey,
        child: ListView(
          children: [
            CustomFormWidget(
                controller: controller.email,
                labelText: 'Email',
                validator: Validators.validateEmail,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email]),
            CustomFormWidget(
                controller: controller.name,
                labelText: 'Name',
                validator: Validators.validateNull,
                autofillHints: const [AutofillHints.name]),
            CustomFormWidget(
                controller: controller.surname,
                labelText: 'Surname',
                validator: Validators.validateNull,
                autofillHints: const [AutofillHints.familyName]),
            CustomFormWidget(
                controller: controller.password,
                labelText: 'Password',
                validator: Validators.validatePassword,
                obscureText: true,
                autofillHints: const [AutofillHints.password]),
            ElevatedButton(
                onPressed: controller.register, child: const Text('Kayıt ol'))
          ],
        ),
      ),
    );
  }
}
