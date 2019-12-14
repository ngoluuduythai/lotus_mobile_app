import 'package:main/routes/profile/sub_routes/documentsids/documentsids.route.dart';
import 'package:main/routes/profile/sub_routes/feedback/feedback.route.dart';
import 'package:main/routes/profile/sub_routes/friends/friends.route.dart';
import 'package:main/routes/profile/sub_routes/gethelp/gethelp.route.dart';
import 'package:main/routes/profile/sub_routes/payments/payments.route.dart';
import 'package:main/routes/profile/sub_routes/edit_info/edit_info.route.dart';
import 'package:main/routes/profile/sub_routes/settings/settings.route.dart';
import 'package:main/routes/profile/sub_routes/termofservice/termofservice.route.dart';
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
