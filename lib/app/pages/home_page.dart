import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Text('homeTitle'.tr),
      ),
    );
  }
}
