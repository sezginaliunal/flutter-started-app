import 'package:flutter/material.dart';
import 'package:started_app/app/data/services/auth/auth_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () =>AuthService().login()),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
