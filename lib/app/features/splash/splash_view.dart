import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/splash/splash_controller.dart';
import 'package:started_app/app/features/user/user.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: FutureBuilder(
        future: controller.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Hata oluştu"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: controller.users.value?.length,
            itemBuilder: (BuildContext context, int index) {
              final userIndex = controller.users.value![index];
              return ListTile(
                title: Text(userIndex.email ?? 'Null'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userIndex.avatar.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
