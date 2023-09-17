import 'package:get/get.dart';
import 'package:md_ponto_app/src/routes/app_routes.dart';
import 'package:md_ponto_app/src/ui/screens/welcome/welcome.screen.dart';

import '../ui/screens/screens.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const Welcome(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    // GetPage(
    //   name: Routes.login,
    //   page: ()=> const LoginPage(),
    //   ),
    GetPage(
      name: Routes.admin,
      page: () => const AdminPage(),
    ),
  ];
}
