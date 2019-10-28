import 'package:sailor/sailor.dart';
import 'package:main/routes/login/login.route.dart';
import 'package:main/routes/profile/profile.route.dart';
import 'package:main/routes/explore/explore.route.dart';
import 'package:main/routes/saved/saved.route.dart';
import 'package:main/routes/stay/stay.route.dart';
import 'package:main/routes/inbox/inbox.route.dart';

class RouteNames {
  static final login = '/login';
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
      name: RouteNames.profile,
      builder: (context, args, params) {
        return ProfileRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.explore,
      builder: (context, args, params) {
        return ExploreRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.saved,
      builder: (context, args, params) {
        return SavedRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.stays,
      builder: (context, args, params) {
        return StayRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.inbox,
      builder: (context, args, params) {
        return InboxRoute();
      },
    ));
  }
}
