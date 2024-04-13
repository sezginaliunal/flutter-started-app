import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/home_controller.dart';
import 'package:started_app/app/res/layouts/future_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(builder: (HomeController controller) {
        return FutureBuilderLayout(
            future: controller.getData(),
            hasSnapshot: Obx(
              () => _listBody(controller),
            ),
            waiting: const Center(child: CircularProgressIndicator()));
      }),
    );
  }

  ListView _listBody(HomeController controller) {
    return ListView.builder(
      itemCount: controller.sampleList.length,
      itemBuilder: (BuildContext context, int index) {
        final sample = controller.sampleList[index];
        final supportUrl = controller.supportUrl;
        return ListTile(
          trailing: Text(supportUrl.value),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(sample.avatar ?? 'Null'),
          ),
          title: Text(sample.firstName ?? 'Null'), // Örnek bir özellik
          subtitle: Text(sample.email ?? 'Null'), // Örnek başka bir özellik
          // Diğer özellikleri buraya ekleyebilirsin
        );
      },
    );
  }
}
