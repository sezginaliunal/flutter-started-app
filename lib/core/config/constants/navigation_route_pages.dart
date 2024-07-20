import 'package:get/route_manager.dart';
import 'package:started_app/app/features/splash/splash_view.dart';
import 'package:started_app/core/bindings/splash.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';

class AppRouter {
  static List<GetPage> getPages = [
    GetPage(
      name: RoutesName.INITIAL_ROUTE,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
