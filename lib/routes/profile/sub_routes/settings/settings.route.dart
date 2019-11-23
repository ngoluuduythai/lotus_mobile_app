import 'package:flutter/material.dart';
import 'package:main/routes/profile/sub_profile_base/sub_profile_base.dart';
import 'package:main/shared/models/auth_user.model.dart';
import 'package:main/shared/store/auth_user/auth_user.store.dart';
import 'package:main/shared/widgets/base_widget/base_widget.dart';
import 'package:main/shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../../../locator.dart';
import '../settings/item_setting_list/item_setting_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  final AuthUser editSettingUser = AuthUser();

  Future _onChanged(AuthUser newValue) async {
    await authUserStore.saveUserApiAlternatte(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: SubProfileBase(
        name: 'Settings',
        child: _notifications(context),
      ));
    });
  }

  Widget _divider() {
    return Divider(thickness: 3, color: Color.fromRGBO(182, 193, 207, 0.21));
  }

  Widget _notifications(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color _activeColor = Color.fromRGBO(255, 186, 115, 1);
    final Color _textColor = Color.fromRGBO(72, 79, 97, 1);
    return Observer(
        builder: (_) => Container(
            width: size.width,
            margin: EdgeInsets.only(left: 21, right: 21, top: 30, bottom: 40),
            padding: EdgeInsets.only(top: 34, left: 21, right: 21, bottom: 40),
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
                    onChanged: (value) async {
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
                ])));
  }
}
