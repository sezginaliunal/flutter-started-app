import 'package:flutter/material.dart';
import 'package:started_app/app/features/splash/splash_view.dart';
import 'package:started_app/core/components/unknown_view.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';

class NavigateManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.INITIAL_ROUTE:
        return _materialPageRoute(const SplashView());

      default:
        return _materialPageRoute(const UnknownView());
    }
  }

  static MaterialPageRoute _materialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
