import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/start.dart';

Future<void> main() async {
  print('*********** DEV ************');
  await DotEnv().load('env/dev.env');
  Routes.createRoutes();
  await setupLocator();
  runApp(MyApp());
}
