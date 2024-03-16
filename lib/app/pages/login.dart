import 'package:flutter/material.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await GetStorageService()
            .saveData(PreferencesKeys.IS_LOGIN.toKeyName(), true);
      }),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
