import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/routes_web/regular/home/home_web.dart';
import './routes/login/login.route.dart';
import './routes_web/routes_web.dart';
import './routes/routes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Only showing in Portrait mode
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    if (kIsWeb) {// running on the web!
      RoutesWeb.createRoutes();
      return MaterialApp(
        title: 'Lotus',
        navigatorKey: RoutesWeb.sailor.navigatorKey,
        onGenerateRoute: RoutesWeb.sailor.generator(),
        home: HomeWebRoute(),
      );
    } else {
      Routes.createRoutes();
      return MaterialApp(
        title: 'Lotus',
        navigatorKey: Routes.sailor.navigatorKey,
        onGenerateRoute: Routes.sailor.generator(),
        home: LoginRoute(),
      );
    }
  }
}
