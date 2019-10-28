import 'package:sailor/sailor.dart';
import 'routes/explore/explore.route.dart';
import 'routes/inbox/inbox.route.dart';
import 'routes/login/login.route.dart';
import 'routes/profile/profile.route.dart';
import 'routes/saved/saved.route.dart';
import 'routes/stay/stay.route.dart';
import './routes/profile/sub_routes/account_settings/account_settings.route.dart';

class RouteNames {
  static const login = '/login';
  static const explore = '/explore';
  static const saved = '/saved';
  static const stays = '/statys';
  static const inbox = '/inbox';
  static const profile = '/profile';
  static const accountSettings = '/profile/account-settings';
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
      name: RouteNames.accountSettings,
      builder: (context, args, params) {
        return AccountSettingsRoute();
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
