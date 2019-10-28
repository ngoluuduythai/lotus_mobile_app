import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/start.dart';

void main() async {
  print('*********** LOCAL ************');
  await DotEnv().load('env/local.env');
  Routes.createRoutes();
  await setupLocator();
  runApp(MyApp());
}
