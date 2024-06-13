import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
          // Add your widgets here
          ),
    );
  }
}
