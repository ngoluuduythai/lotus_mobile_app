import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:flutter/services.dart';
import './routes/login/login.route.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Only showing in Portrait mode
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      title: 'Lotus',
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
      home: LoginRoute(),
    );
  }
}
