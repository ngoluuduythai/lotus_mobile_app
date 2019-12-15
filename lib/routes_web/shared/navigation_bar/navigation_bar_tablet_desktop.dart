import 'package:flutter/material.dart';

import '../../routes_web.dart';
import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Locations', RouteWebNames.locations),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About', RouteWebNames.home),
            ],
          )
        ],
      ),
    );
  }
}
