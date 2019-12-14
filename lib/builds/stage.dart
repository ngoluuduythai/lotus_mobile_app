import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/start.dart';

Future<void> main() async {
  print('*********** STAGE ************');
  await DotEnv().load('env/stage.env');
  await setupLocator();
  runApp(MyApp());
}
