import 'package:sailor/sailor.dart';
import './regular/home/home_web.dart';
import './regular/locations/locations_web.dart';

class RouteWebNames {
  static const home = '/home';
  static const locations = '/locations';
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

    sailor.addRoute(SailorRoute(
      name: RouteWebNames.locations,
      builder: (context, args, params) {
        return LocationsWebRoute();
      },
    ));
  }
}
