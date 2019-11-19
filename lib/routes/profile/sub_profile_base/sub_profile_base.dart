import 'package:flutter/material.dart';
import '../../../shared/constants/icon_paths.dart';
import './../../../routes.dart';

class SubProfileBase extends StatelessWidget {
  SubProfileBase({ @required this.name, @required this.child});
  String name;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 0, right: 20, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          IconPath.backArrow,
                          width: 14,
                          height: 17,
                        ),
                        onPressed: () {
                          Routes.sailor.navigate(
                            RouteNames.profile,
                          );
                        },
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 220),
                          child: GestureDetector(
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Color(0xff0b0b0b),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'AirbnbCerealApp',
                                fontStyle: FontStyle.normal,
                                fontSize: 21.0,
                              ),
                            ),
                            onTap: () =>
                                Routes.sailor.navigate(RouteNames.profile),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
