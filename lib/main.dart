import 'package:flutter/material.dart';
import 'package:started_app/app.dart';
import 'package:started_app/core/config/di/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(
    const MyApp(),
  );
}
