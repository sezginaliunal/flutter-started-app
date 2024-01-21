import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/layouts/main/main_layout.dart';

import '../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: const Center(child: Text('Home')),
    );
  }
}
