import 'package:flutter/material.dart';
// import 'package:main/responsive/screen_type_layouts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import './home_mobile_web.dart';
import './home_desktop_web.dart';

class HomeWebRoute extends StatelessWidget {
  HomeWebRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobileWebRoute(),
      tablet: HomeDesktopWebRoute(),
      desktop: HomeDesktopWebRoute(),
    );
  }
}
