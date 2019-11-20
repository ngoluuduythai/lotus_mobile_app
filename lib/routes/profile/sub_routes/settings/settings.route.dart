import 'package:flutter/material.dart';
import 'package:main/routes/profile/sub_routes/settings/settingsDivider.dart';
import 'package:main/shared/constants/colors.dart';
import 'package:main/shared/constants/icon_paths.dart';
import 'package:main/shared/widgets/base_widget/base_widget.dart';
import 'package:main/shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';

import '../../../../routes.dart';

class SettingsRoute extends StatelessWidget {
  bool switchOn = false;

  void _onSwitchChanged(bool value) {
    switchOn = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: MaterialApp(
              home: Scaffold(
                  body: SingleChildScrollView(
                      child: Container(
        height: size.height - 40,
        decoration: BoxDecoration(color: AppColor.backgroundGrey),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 43, left: 19),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 120),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 21.0,
                                ),
                              ),
                            ),
                          ])
                    ])),
            Container(
                width: size.width,
                height: size.height - 195,
                margin:
                    EdgeInsets.only(left: 21, right: 21, top: 30, bottom: 30),
                padding: EdgeInsets.only(top: 34, left: 21, right: 21),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(21))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DividerSettings(
                        title: 'Notifications',
                        subTitle: null,
                        notHaveSubTitle: false,
                      ),
                      DividerSettings(
                          title: null, subTitle: null, notHaveSubTitle: false),
                      DividerSettings(
                          title: 'Email',
                          subTitle: null,
                          notHaveSubTitle: true),
                      DividerSettings(
                          title: null, subTitle: null, notHaveSubTitle: false),
                      DividerSettings(
                          title: 'Push Notifications',
                          subTitle: 'To your mobile or tablet device',
                          notHaveSubTitle: true),
                      DividerSettings(
                          title: null, subTitle: null, notHaveSubTitle: false),
                      DividerSettings(
                          title: 'Text Messages',
                          subTitle: null,
                          notHaveSubTitle: true),
                      DividerSettings(
                          title: null, subTitle: null, notHaveSubTitle: false),
                      DividerSettings(
                        title: 'Visibility',
                        subTitle: null,
                        notHaveSubTitle: false,
                      ),
                      DividerSettings(
                          title: null, subTitle: null, notHaveSubTitle: false),
                      DividerSettings(
                          title: 'Roommate Visibility',
                          subTitle: null,
                          notHaveSubTitle: true),
                      DividerSettings(
                          title: null, subTitle: null, notHaveSubTitle: false),
                    ]))
          ],
        ),
      )))));
    });
  }
}
