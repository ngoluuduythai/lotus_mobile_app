import 'package:main/routes/profile/sub_routes/feedback/feedback.route.dart';
import 'package:main/routes/profile/sub_routes/friends/friends.route.dart';
import 'package:main/routes/profile/sub_routes/gethelp/gethelp.route.dart';
import 'package:main/routes/profile/sub_routes/notifications/notifications.route.dart';
import 'package:main/routes/profile/sub_routes/payments/payments.route.dart';
import 'package:main/routes/profile/sub_routes/personal_information/personal_information.route.dart';
import 'package:main/routes/profile/sub_routes/termofservice/termofservice.route.dart';
import 'package:sailor/sailor.dart';
import 'routes/explore/explore.route.dart';
import 'routes/inbox/inbox.route.dart';
import 'routes/login/login.route.dart';
import 'routes/profile/profile.route.dart';
import 'routes/profile/sub_routes/documentsids/documentsids.route.dart';
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
  static const documentsids = '/profile/sub_routes/documentsids/documentsids.route.dart';

  static const feedback = '/profile/sub_routes/feedback/feedback.route.dart';

  static const friends = '/profile/sub_routes/friends/friends.route.dart'; 

  static const gethelp = '/profile/sub_routes/gethelp/gethelp.route.dart'; 

  static const notifications = '/profile/sub_routes/notifications/notifications.route.dart'; 
  
  static const payments = '/profile/sub_routes/payments/payments.route.dart'; 

  static const personal_information ='/profile/sub_routes/personal_information/personal_information.route.dart';

  static const termofservice ='/profile/sub_routes/termofservice/termofservice.route.dart' ;
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
      name: RouteNames.notifications,
      builder: (context, args, params) {
        return NotificationsRoute();
      },
    ));

      
      
       sailor.addRoute(SailorRoute(
      name: RouteNames.payments,
      builder: (context, args, params) {
        return PaymentsRoute();
      },
    ));

      
       sailor.addRoute(SailorRoute(
      name: RouteNames.personal_information,
      builder: (context, args, params) {
        return PersonalInformationRoute();
      },
    ));
    
    
       sailor.addRoute(SailorRoute(
      name: RouteNames.termofservice,
      builder: (context, args, params) {
        return TermofserviceRoute();
      },
    ));


  }
}
