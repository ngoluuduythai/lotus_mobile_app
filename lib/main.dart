import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:main/routes/home/home.route.dart';
import 'package:main/routes/login/login.route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  await DotEnv().load('local.env');
  Routes.createRoutes();

  await setupLocator();
  runApp(MyApp());
}

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