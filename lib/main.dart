import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:started_app/app.dart';
import 'package:started_app/core/config/locator/locator_service.dart';
import 'package:started_app/core/controllers/theme_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(
    ChangeNotifierProvider(
      create: (_) => getIt<ThemeNotifier>(),
      child: const MyApp(),
    ),
  );
}
