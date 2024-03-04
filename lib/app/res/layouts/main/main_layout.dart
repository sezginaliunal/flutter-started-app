// views/main_layout.dart
import 'package:flutter/cupertino.dart';
import 'package:started_app/app/controllers/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/data/services/theme_service.dart';
import '../../../controllers/main_controller.dart';

class MainLayout extends GetView<MainController> {
  final Widget child;

  MainLayout({Key? key, required this.child}) : super(key: key);
  final NetworkController networkController = Get.find<NetworkController>();
  final ThemeMode currentThemeMode = ThemeService.instance.themeMode;
  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
        child: networkController.connectionStatus.value == 0
            ? const Text('No Connection')
            : child));
  }
}
