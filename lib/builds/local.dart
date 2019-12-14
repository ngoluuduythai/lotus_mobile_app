import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/start.dart';

Future<void> main() async {
  print('*********** LOCAL ************');
  await DotEnv().load('env/local.env');
  await setupLocator();
  runApp(MyApp());
}
