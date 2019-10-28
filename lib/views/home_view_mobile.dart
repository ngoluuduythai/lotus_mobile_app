// Contains the widgets that will be used for Mobile layout of Home ,
// portrait and landscape

import 'package:flutter/material.dart';
import 'package:main/widgets/app_drawer/app_drawer.dart';

class HomeMobilePortrait extends StatelessWidget {
  HomeMobilePortrait({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(Icons.menu, size: 30),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ))
        ],
      ),
    );
  }
}

class HomeMobileLandscape extends StatelessWidget {
  HomeMobileLandscape({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[AppDrawer()],
      ),
    );
  }
}
