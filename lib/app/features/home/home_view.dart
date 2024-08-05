import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/home/home_controller.dart';
import 'package:started_app/app/features/user/user.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: controller.authController.logout,
              icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder<User?>(
        future: controller.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No user data found'));
          } else {
            final user = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${user.name}'),
                  Text('Email: ${user.email}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
