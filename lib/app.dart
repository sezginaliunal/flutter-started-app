import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:started_app/core/config/constants/app_infos.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';
import 'package:started_app/core/config/navigation/navigation_manager.dart';
import 'package:started_app/core/controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: AppInfos.appName,
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.getThemeData(),
          initialRoute: RoutesName.INITIAL_ROUTE,
          onGenerateRoute: NavigateManager.generateRoute,
        );
      },
    );
  }
}
