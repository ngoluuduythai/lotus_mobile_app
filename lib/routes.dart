import 'package:sailor/sailor.dart';
import 'package:main/routes/login/login.route.dart';
import 'package:main/routes/home/home.route.dart';
import 'package:main/routes/profile/profile.route.dart';

class RouteNames {
  static final login = '/login';
  static final home = '/home';
  static final explore = '/explore';
  static final saved = '/saved';
  static final stays = '/statys';
  static final inbox = '/inbox';
  static final profile = '/profile';
}
class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: RouteNames.login,
      builder: (context, args, params) {
        return LoginRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.home,
      builder: (context, args, params) {
        return HomeRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.profile,
      builder: (context, args, params) {
        return ProfileRoute();
      },
    ));
  }
}