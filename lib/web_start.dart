import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/routes_web/regular/home/home_web.dart';
import './routes_web/routes_web.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Only showing in Portrait mode
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    RoutesWeb.createRoutes();
    return MaterialApp(
      title: 'Lotus',
      navigatorKey: RoutesWeb.sailor.navigatorKey,
      onGenerateRoute: RoutesWeb.sailor.generator(),
      home: HomeWebRoute(),
    );
  }
}