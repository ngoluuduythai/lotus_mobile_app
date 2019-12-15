import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './web_start.dart';

Future<void> main() async {
  print('*********** DEV ************');
  await DotEnv().load('env/local.env');
  await setupLocator();
  runApp(MyApp());
}
