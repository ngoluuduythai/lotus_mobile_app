import 'package:flutter/material.dart';
import 'package:main/widgets/app_drawer/app_drawer.dart';

class AppDrawerMobile extends StatelessWidget {
  const AppDrawerMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      width: orientation == Orientation.portrait ? 250 : 100,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black12)]),
      child: Column(
        children: AppDrawer.getDrawerOptions(),
      ),
    );
  }
}
