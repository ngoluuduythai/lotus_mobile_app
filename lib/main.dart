import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/start.dart';
//will deploy env vars from env/local.env
void main() async {
  await DotEnv().load('env/local.env');
  Routes.createRoutes();
  await setupLocator();
  runApp(MyApp());
}
