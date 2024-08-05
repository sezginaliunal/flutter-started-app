import 'package:get/route_manager.dart';
import 'package:started_app/app/features/auth/views/login.dart';
import 'package:started_app/app/features/auth/views/register.dart';
import 'package:started_app/app/features/home/home_view.dart';
import 'package:started_app/app/features/splash/splash_view.dart';
import 'package:started_app/core/bindings/auth.dart';
import 'package:started_app/core/bindings/home.dart';
import 'package:started_app/core/bindings/splash.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';

class AppRouter {
  static List<GetPage> getPages = [
    GetPage(
      name: RoutesName.INITIAL_ROUTE,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesName.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesName.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesName.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
