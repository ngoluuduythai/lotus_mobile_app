import 'package:flutter/material.dart';
import './item_edit_list/item_edit_list.dart';
import '../../../../shared/constants/icon_paths.dart';
import '../../../../locator.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import './../../../../routes.dart';
import '../../../../shared/models/auth_user.model.dart';

class PersonalInformationRoute extends StatelessWidget {
  PersonalInformationRoute();
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  AuthUser editUser = AuthUser();

  greyDivider() {
    return Container(
      child: Divider(
        color: Colors.grey,
        height: 1,
        indent: 25,
        endIndent: 25,
      ),
    );
  }

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
                        margin: EdgeInsets.only(right: 120),
                        child: Text(
                          'Edit Personal Info',
                          style: TextStyle(
                            color: Color(0xff0b0b0b),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 21.0,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Color(0xff0b0b0b),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        onTap: () async {
                          await authUserStore.saveUserApi(editUser);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 372,
                  height: 500,
                  margin: EdgeInsets.only(top: 31, bottom: 31),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      ItemEditList(
                        onChanged: (val) {
                          editUser.firstName = val;
                        },
                        iconImageLocation: IconPath.cross,
                        title: 'First name:',
                        userValue: authUserStore.authUser.firstName,
                        color: Color(0xFF0B0B0B),
                        color2: Color(0xFF484F61),
                      ),
                       greyDivider(),
                   ItemEditList(
                        onChanged: (val) {
                          editUser.lastName = val;
                        },
                        iconImageLocation: IconPath.cross,
                        title: 'Last name:',
                        userValue: authUserStore.authUser.lastName,
                        color: Color(0xFF0B0B0B),
                        color2: Color(0xFF484F61),
                      ),
                      // greyDivider(),
                      // ItemEditList(
                      //   iconImageLocation: IconPath.cross,
                      //   text: 'Gender:',
                      //   text2: 'Gender',
                      //   color: Color(0xFF0B0B0B),
                      //   color2: Color(0xFF484F61),
                      //   onTap: () => (''),
                      //   route: RouteNames.profile,
                      // ),
                      // greyDivider(),
                      // ItemEditList(
                      //   iconImageLocation: IconPath.cross,
                      //   text: 'Email:',
                      //   text2: authUserStore.authUser.email,
                      //   color: Color(0xFF0B0B0B),
                      //   color2: Color(0xFF484F61),
                      //   onTap: () => (''),
                      //   route: RouteNames.profile,
                      // ),
                      // greyDivider(),
                      // ItemEditList(
                      //   iconImageLocation: IconPath.cross,
                      //   text: 'Phone:',
                      //   text2: authUserStore.authUser.phone,
                      //   color: Color(0xFF0B0B0B),
                      //   color2: Color(0xFF484F61),
                      //   onTap: () => (''),
                      //   route: RouteNames.profile,
                      // ),
                      // greyDivider(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
