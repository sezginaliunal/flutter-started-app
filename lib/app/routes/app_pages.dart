import 'package:get/get.dart';
import 'package:started_app/app/bindings/splash_binding.dart';
import 'package:started_app/app/pages/auth_page.dart';
import 'package:started_app/app/pages/login.dart';
import 'package:started_app/app/pages/splash.dart';
import 'package:started_app/app/pages/unknown_route_page.dart';

import '../bindings/home_binding.dart';
import '../pages/home_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );
  static final homePage = GetPage(
    name: AppRoutes.HOME,
    page: () => const HomePage(),
    binding: HomeBinding(),
    transition: _defaultTransition,
  );
  static final splashPage = GetPage(
    name: AppRoutes.SPLASH,
    page: () => const SplashPage(),
    binding: SplashBinding(),
    transition: _defaultTransition,
  );
  static final loginPage = GetPage(
    name: AppRoutes.LOGIN,
    page: () => const LoginPage(),
    transition: _defaultTransition,
  );
  static final authPage = GetPage(
    name: AppRoutes.AUTH,
    page: () => const AuthPage(),
    transition: _defaultTransition,
  );
  static final List<GetPage> pages = [
    unknownRoutePage,
    homePage,
    splashPage,
    loginPage,
    authPage,
  ];
}
