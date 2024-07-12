import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:started_app/core/controllers/theme_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Switch(
              value: themeNotifier.isDarkMode(),
              onChanged: (val) {
                themeNotifier.switchTheme();
              })
        ],
      ),
    );
  }
}
