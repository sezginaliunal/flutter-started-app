import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/home_controller.dart';
import 'package:started_app/app/res/layouts/main/main_layout.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => controller.getData()),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.sampleList.length,
          itemBuilder: (BuildContext context, int index) {
            final sampleModel = controller.sampleList[index];
            return ListTile(
              title: Text(sampleModel.email),
            );
          },
        ),
      ),
    ));
  }
}
