import 'package:flutter/material.dart';
import 'package:main/routes/profile/sub_routes/settings/switch.dart';
import 'package:main/shared/constants/colors.dart';

class DividerSettings extends StatelessWidget {
  const DividerSettings(
      {@required this.title, this.subTitle, this.notHaveSubTitle});
  final String title;
  final String subTitle;
  final bool notHaveSubTitle;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return Divider(thickness: 2, color: AppColor.lightGrey);
    } else if (title != null && subTitle == null && !notHaveSubTitle) {
      return Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'AirbnbCerealApp',
                fontSize: 18,
                letterSpacing: -0.54,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
          ));
    } else if (notHaveSubTitle && title != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              // margin: EdgeInsets.only(top: 30),
              child: Text(title,
                  style: TextStyle(
                      fontFamily: 'AirbnbCerealApp',
                      fontSize: 18,
                      letterSpacing: -0.54,
                      color: AppColor.lightOrange))),
          Container(
              // margin: EdgeInsets.only(top: 30),
              child: SwitchSettings(switchValue: true))
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: 'AirbnbCerealApp',
                          fontSize: 18,
                          letterSpacing: -0.54,
                          color: AppColor.lightOrange))),
              Container(child: SwitchSettings(switchValue: true))
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(subTitle,
                      style: TextStyle(
                          fontFamily: 'AirbnbCerealApp',
                          fontSize: 13,
                          letterSpacing: -0.39,
                          color: AppColor.lightOrange)))
            ],
          ),
        ],
      );
    }
  }
}
