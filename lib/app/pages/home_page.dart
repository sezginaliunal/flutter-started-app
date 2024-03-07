import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/home_controller.dart';
import 'package:started_app/app/controllers/translation_controller.dart';
import 'package:started_app/app/data/services/theme_service.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [ChangeThemeButton()],
      ),
      floatingActionButton: const ChangeLanguageButton(),
      body: Center(
        child: Text('homeTitle'.tr),
      ),
    );
  }
}

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.bottomSheet(
        SizedBox(
          height: Get.height / 4,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select Language',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    TranslationController().changeLanguage('tr_TR');
                    Get.back();
                  },
                  title: const Text('Turkish'),
                  leading: const Icon(Icons.language),
                ),
                ListTile(
                  onTap: () {
                    TranslationController().changeLanguage('en_US');
                    Get.back();
                  },
                  title: const Text('İngilizce'),
                  leading: const Icon(Icons.language),
                ),
                // Add more ListTile widgets for other languages if needed
              ],
            ),
          ),
        ),
      ),
      child: const Icon(Icons.language),
    );
  }
}

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.bottomSheet(
        SizedBox(
          height: Get.height / 4,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select Theme',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    ThemeService.instance.themeMode = ThemeMode.dark;
                    Get.back();
                  },
                  title: const Text('Dark'),
                  leading: const Icon(Icons.dark_mode),
                ),
                ListTile(
                  onTap: () {
                    ThemeService.instance.themeMode = ThemeMode.light;
                    Get.back();
                  },
                  title: const Text('Light'),
                  leading: const Icon(Icons.light_mode),
                ),
                // Add more ListTile widgets for other themes if needed
              ],
            ),
          ),
        ),
      ),
      icon: const Icon(Icons.palette),
    );
  }
}
