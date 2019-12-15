import 'package:flutter/material.dart';
import 'package:main/routes_web/shared/centered_view/centered_view.dart';
import 'package:main/routes_web/shared/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../navigation_drawer/navigation_drawer.dart';
class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              child,
            ],
          ),
        ),
      ),
    );
  }
}