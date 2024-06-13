import 'package:get/get.dart';
import 'package:started_app/app/routes/app_routes.dart';
import 'package:started_app/app/views/home_view.dart';
import 'package:started_app/app/views/splash_view.dart';
import 'package:started_app/core/bindings/home_binding.dart';
import 'package:started_app/core/bindings/splash_binding.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final splashView = GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      transition: _defaultTransition,
      binding: SplashBinding());

  static final homeView = GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      transition: _defaultTransition,
      binding: HomeBinding());

  static final List<GetPage> pages = [splashView, homeView];
}
