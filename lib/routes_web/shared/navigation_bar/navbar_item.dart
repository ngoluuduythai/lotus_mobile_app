import 'package:flutter/material.dart';
import 'package:main/routes_web/routes_web.dart';
import 'package:sailor/sailor.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navPath;
  const NavBarItem(this.title, this.navPath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutesWeb.sailor.navigate(navPath, transitionDuration: Duration(microseconds: 0),);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      )
    );
  }
}