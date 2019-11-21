import 'package:flutter/material.dart';
import 'package:main/routes/profile/sub_routes/settings/item_setting_list/item_setting_list.dart';
import 'package:main/shared/constants/icon_paths.dart';
import 'package:main/shared/models/auth_user.model.dart';
import 'package:main/shared/store/auth_user/auth_user.store.dart';
import 'package:main/shared/widgets/base_widget/base_widget.dart';
import 'package:main/shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';

import '../../../../locator.dart';
import '../../../../routes.dart';

class SettingsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  final AuthUser editSettingUser = AuthUser();

  Future _onChanged(AuthUser newValue) async  { 
    await authUserStore.saveUserApiAlternatte(newValue);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color _activeColor = Color.fromRGBO(255, 186, 115, 1);
    final Color _textColor = Color.fromRGBO(72, 79, 97, 1);

    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: MaterialApp(
              home: Scaffold(
                  body: SingleChildScrollView(
                      child: Container(
        height: size.height,
        decoration: BoxDecoration(color: Color.fromRGBO(182, 193, 207, 0.21)),
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
                              child: InkWell(
                                child: Text(
                                  'Settings',
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
                              ),
                            ),
                          ])
                    ])),
            Container(
                width: size.width,
                margin:
                    EdgeInsets.only(left: 21, right: 21, top: 30, bottom: 40),
                padding:
                    EdgeInsets.only(top: 34, left: 21, right: 21, bottom: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(21))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Notifications',
                            style: TextStyle(
                                fontFamily: 'AirbnbCerealApp',
                                fontSize: 18,
                                letterSpacing: -0.54,
                                fontWeight: FontWeight.bold,
                                color: _textColor),
                          )),
                      ItemSettingList(
                        text: 'Email',
                        value: authUserStore.authUser.notifyByEmail,
                        color: _textColor,
                        activeColor: _activeColor,
                        onChanged: (value) async {
                          editSettingUser.notifyByEmail = value;
                          await _onChanged(editSettingUser);
                        },
                      ),
                      _divider(),
                      ItemSettingList(
                        text: 'Push Notifications',
                        value: authUserStore.authUser.notifyInApp,
                        color: _textColor,
                        activeColor: _activeColor,
                        onChanged: (bool value) async {
                          editSettingUser.notifyInApp = value;
                          await _onChanged(editSettingUser);
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text('To your mobile or tablet device',
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 13,
                                      letterSpacing: -0.39,
                                      color: _textColor)))
                        ],
                      ),
                      _divider(),
                      ItemSettingList(
                        text: 'Text Messages',
                        value: authUserStore.authUser.notifyByText,
                        color: _textColor,
                        activeColor: _activeColor,
                        onChanged: (value) async {
                          editSettingUser.notifyByText = value;
                          await _onChanged(editSettingUser);
                        },
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
                                color: _textColor),
                          )),
                      _divider(),
                      ItemSettingList(
                        text: 'Roommate Visibility',
                        value: authUserStore.authUser.showInRoommateSearch,
                        color: _textColor,
                        activeColor: _activeColor,
                        onChanged: (value) async {
                          editSettingUser.showInRoommateSearch = value;
                          await _onChanged(editSettingUser);
                        },
                      ),
                      _divider(),
                    ]))
          ],
        ),
      )))));
    });
  }

  Widget _divider() {
    return Divider(thickness: 1, color: Color.fromRGBO(234, 236, 245, 1));
  }
}
