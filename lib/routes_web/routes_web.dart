import 'package:sailor/sailor.dart';
import './regular/home/home_web.dart';

class RouteWebNames {
  static const home = '/home';
}

class RoutesWeb {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: RouteWebNames.home,
      builder: (context, args, params) {
        return HomeWebRoute();
      },
    ));
  }
}
