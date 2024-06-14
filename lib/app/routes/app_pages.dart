import 'package:get/get.dart';
import 'package:started_app/app/routes/app_routes.dart';
import 'package:started_app/app/features/splash/splash_binding.dart';
import 'package:started_app/app/features/splash/splash_view.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final splashView = GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      transition: _defaultTransition,
      binding: SplashBinding());

  static final List<GetPage> pages = [splashView];
}
