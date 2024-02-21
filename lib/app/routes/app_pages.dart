import 'package:get/get.dart';
import 'package:started_app/app/bindings/auth_binding.dart';
import 'package:started_app/app/bindings/splash_binding.dart';
import 'package:started_app/app/pages/auth/login.dart';
import 'package:started_app/app/pages/auth/register.dart';
import 'package:started_app/app/pages/splash.dart';

import '../bindings/home_binding.dart';
import '../pages/home_page.dart';
import '../pages/unknown_route_page.dart';
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
  static final registerPage = GetPage(
    name: AppRoutes.REGISTER,
    page: () => const RegisterPage(),
    binding: AuthBinding(),
    transition: _defaultTransition,
  );
  static final loginPage = GetPage(
    name: AppRoutes.LOGIN,
    page: () => const LoginPage(),
    binding: AuthBinding(),
    transition: _defaultTransition,
  );
  static final List<GetPage> pages = [
    unknownRoutePage,
    homePage,
    splashPage,
    registerPage,
    loginPage
  ];
}
