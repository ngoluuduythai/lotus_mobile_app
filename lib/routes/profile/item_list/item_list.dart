import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes.dart';

class ItemList extends StatelessWidget {
  ItemList({
    @required this.text,
    @required this.iconImageLocation,
    this.color = const Color(0xFF484F61),
    this.onTap,
    this.route,
  });

  final String text;
  final String iconImageLocation;
  final Function onTap;
  final Color color;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(45), right: ScreenUtil().setWidth(45)),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(40),
                  bottom: ScreenUtil().setHeight(35)),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'AirbnbCerealApp',
                  fontStyle: FontStyle.normal,
                  fontSize: ScreenUtil().setSp(36),
                ),
              ),
            ),
            Container(
                height: ScreenUtil().setHeight(41),
                width: ScreenUtil().setWidth(42),
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
