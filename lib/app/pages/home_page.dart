import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => controller.postSampleHttp()),
      body: Obx(() => ListView.builder(
            itemCount: controller.sampleList.length,
            itemBuilder: (BuildContext context, int index) {
              final responseData = controller.sampleList[index];
              return Card(
                child: ListTile(
                  title: Text(responseData.email ??
                      'No Email'), // Örneğin email özelliğini gösteriyorum.
                ),
              );
            },
          )),
    );
  }
}
