import 'package:flutter/material.dart';
import 'package:main/routes/profile/sub_profile_base/sub_profile_base.dart';
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
          child: SubProfileBase(name: 'Settings',child: _notifications(context),)
          );
    });
  }

  Widget _divider() {
    return Divider(thickness: 3, color: Color.fromRGBO(182, 193, 207, 0.21));
  }
  Widget _notifications(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return Container(
                width: size.width,
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
                      Container(
                          child: Text(
                        'Notifications',
                        style: TextStyle(
                            fontFamily: 'AirbnbCerealApp',
                            fontSize: 18,
                            letterSpacing: -0.54,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(72, 79, 97, 1)),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text('Email',
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 18,
                                      letterSpacing: -0.54,
                                      color: Color.fromRGBO(72, 79, 97, 1)))),
                          Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Switch(
                                  onChanged: _onSwitchChanged,
                                  value: switchOn,
                                  activeTrackColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeThumbImage:
                                      AssetImage(IconPath.checkSwitch),
                                  inactiveThumbImage:
                                      AssetImage(IconPath.noCheckSwitch)))
                        ],
                      ),
                      _divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Text('Push Notifications',
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 18,
                                      letterSpacing: -0.54,
                                      color: Color.fromRGBO(72, 79, 97, 1)))),
                          Container(
                              child: Switch(
                                  onChanged: _onSwitchChanged,
                                  value: switchOn,
                                  activeTrackColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeThumbImage:
                                      AssetImage(IconPath.checkSwitch),
                                  inactiveThumbImage:
                                      AssetImage(IconPath.noCheckSwitch)))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Text('To your mobile or tablet device',
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 13,
                                      letterSpacing: -0.39,
                                      color: Color.fromRGBO(72, 79, 97, 1))))
                        ],
                      ),
                      _divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Text('Text Messages',
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 18,
                                      letterSpacing: -0.54,
                                      color: Color.fromRGBO(72, 79, 97, 1)))),
                          Container(
                              child: Switch(
                                  onChanged: _onSwitchChanged,
                                  value: switchOn,
                                  activeTrackColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeThumbImage:
                                      AssetImage(IconPath.checkSwitch),
                                  inactiveThumbImage:
                                      AssetImage(IconPath.noCheckSwitch)))
                        ],
                      ),
                      _divider(),
                      Container(
                          margin: EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            'Visibility',
                            style: TextStyle(
                                fontFamily: 'AirbnbCerealApp',
                                fontSize: 18,
                                letterSpacing: -0.54,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(72, 79, 97, 1)),
                          )),
                      _divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Text('Roommate Visibility',
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 18,
                                      letterSpacing: -0.54,
                                      color: Color.fromRGBO(72, 79, 97, 1)))),
                          Container(
                              child: Switch(
                                  onChanged: _onSwitchChanged,
                                  value: switchOn,
                                  activeTrackColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeColor: Color.fromRGBO(
                                    255,
                                    186,
                                    115,
                                    1,
                                  ),
                                  activeThumbImage:
                                      AssetImage(IconPath.checkSwitch),
                                  inactiveThumbImage:
                                      AssetImage(IconPath.noCheckSwitch)))
                        ],
                      ),
                      _divider(),
                    ]));
  }
}
