import 'package:english_lists/app/pages/details/details_binding.dart';
import 'package:english_lists/app/pages/details/details_page.dart';
import 'package:get/get.dart';

import '../pages/home/home_binding.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_binding.dart';
import '../pages/login/login_page.dart';
import '../pages/register/register_binding.dart';
import '../pages/register/register_page.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => const DetailsPage(),
      binding: DetailsBinding(),
    ),
  ];
}
