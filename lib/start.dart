import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:main/routes/login/login.route.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotus',
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
      home: LoginRoute(),
    );
  }
}
