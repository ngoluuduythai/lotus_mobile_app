import 'package:flutter/material.dart';
import '../../../routes.dart';

class ItemEditList extends StatelessWidget {
  ItemEditList({
    @required this.text,
    @required this.text2,
    @required this.iconImageLocation,
    this.color = const Color(0xff0b0b0b),
    this.color2,
    this.onTap,
    this.route,
  });

  final String text;
  final String text2;
  final String iconImageLocation;
  final Function onTap;
  final Color color;
  final String route;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23.8, right: 20),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AirbnbCerealApp',
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, right: 20),
              child: Text(
                text2,
                style: TextStyle(
                  color: color2,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'AirbnbCerealApp',
                  fontStyle: FontStyle.normal,
                  fontSize: 17.0,
                ),
              ),
            ),
            Container(
                height: 21,
                width: 21,
                child: Tab(
                    icon: Image.asset(
                  iconImageLocation,
                ))),
          ],
        ),
        onTap: () {
          if (route != null) {
            Routes.sailor.navigate(route);
          } else {
            onTap();
          }
        },
      ),
    );
  }
}
