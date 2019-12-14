import 'package:flutter/material.dart';
// import 'package:main/responsive/screen_type_layouts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeWebRoute extends StatelessWidget {
  HomeWebRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout(
      mobile: Container(color:Colors.blue),
      tablet: Container(color: Colors.yellow),
      desktop: Container(color: Colors.red),
    );
  }
}
