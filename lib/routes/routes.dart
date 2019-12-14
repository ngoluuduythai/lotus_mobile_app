import 'package:main/routes/profile/sub_routes/documentsids/documentsids.route.dart';
import 'package:main/routes/profile/sub_routes/feedback/feedback.route.dart';
import 'package:main/routes/profile/sub_routes/friends/friends.route.dart';
import 'package:main/routes/profile/sub_routes/gethelp/gethelp.route.dart';
import 'package:main/routes/profile/sub_routes/payments/payments.route.dart';
import 'package:main/routes/profile/sub_routes/edit_info/edit_info.route.dart';
import 'package:main/routes/profile/sub_routes/settings/settings.route.dart';
import 'package:main/routes/profile/sub_routes/termofservice/termofservice.route.dart';
import 'package:sailor/sailor.dart';
import './explore/explore.route.dart';
import './inbox/inbox.route.dart';
import './login/login.route.dart';
import './profile/profile.route.dart';
import './profile/sub_routes/view_profile/view_profile.route.dart';
import './saved/saved.route.dart';
import './rentals/rentals.route.dart';

class RouteNames {
  static const login = '/login';
  static const explore = '/explore';
  static const saved = '/saved';
  static const rentals = '/rentals';
  static const inbox = '/inbox';
  static const profile = '/profile';
  static const documentsids = '/profile/documentsids';
  static const feedback = '/profile/feedback';
  static const friends = '/profile/friends';
  static const gethelp = '/profile/gethelp';
  static const settings = '/profile/settings';
  static const payments = '/profile/payments';
  static const edit_info = '/profile/edit_info';
  static const termofservice = '/profile/termofservice';
  static const viewprofile = '/profile/view_profile';
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
      name: RouteNames.rentals,
      builder: (context, args, params) {
        return RentalsRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.inbox,
      builder: (context, args, params) {
        return InboxRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.documentsids,
      builder: (context, args, params) {
        return DocumentsidsRoute();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: RouteNames.feedback,
      builder: (context, args, params) {
        return FeedbackRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.friends,
      builder: (context, args, params) {
        return FriendsRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.gethelp,
      builder: (context, args, params) {
        return GethelpRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.settings,
      builder: (context, args, params) {
        return SettingsRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.payments,
      builder: (context, args, params) {
        return PaymentsRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.edit_info,
      builder: (context, args, params) {
        return EditInfoRoute();
      },
    ));

    sailor.addRoute(SailorRoute(
      name: RouteNames.termofservice,
      builder: (context, args, params) {
        return TermofserviceRoute();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: RouteNames.viewprofile,
      builder: (context, args, params) {
        return ViewProfileRoute();
      },
    ));
  }
}
