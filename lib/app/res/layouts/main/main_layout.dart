import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/network_controller.dart';
import '../../../controllers/main_controller.dart';

class MainLayout extends GetView<MainController> {
  final Widget child;

  MainLayout({Key? key, required this.child}) : super(key: key);

  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (networkController.connectionStatus.value == 0) {
          return const Center(child: Text('No Connection'));
        } else {
          return child;
        }
      }),
    );
  }
}
