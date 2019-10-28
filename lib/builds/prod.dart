import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/start.dart';

void main() async {
  print('*********** PROD ************');
  await DotEnv().load('env/prod.env');
  Routes.createRoutes();
  await setupLocator();
  runApp(MyApp());
}
