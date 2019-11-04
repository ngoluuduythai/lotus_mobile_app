import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../routes.dart';
import 'package:main/locator.dart';
import './item_list/item_list.dart';
import 'package:sailor/sailor.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import '../../shared/constants/icon_paths.dart';

class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  static final sailor = Sailor();

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
    print(authUserStore.authUser);
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(255, 186, 115, 1),
                                  width: 2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                                  )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 22, bottom: 2),
                          child: Column(
                            children: <Widget>[
                              Observer(
                                  builder: (_) =>
                                      Text('${authUserStore.authUser.fullName}',
                                          style: TextStyle(
                                            color: Color(0xff0b0b0b),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 21.0,
                                          ))),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                child: InkWell(
                                  child: Text(
                                    'View profile',
                                    style: TextStyle(
                                      color: Color.fromRGBO(223, 148, 61, 1),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'AirbnbCerealApp',
                                      fontStyle: FontStyle.normal,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  //onTap: (),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 31),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 20, left: 5, right: 120, bottom: 15),
                          width: 208,
                          height: 25,
                          child: Text(
                            'Account Settings',
                            style: TextStyle(
                              color: Color(0xff0b0b0b),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'AirbnbCerealApp',
                              fontStyle: FontStyle.normal,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        greyDivider(),
                        ItemList(
                            text: 'Personal Information',
                            iconImageLocation: IconPath.document,
                            route: RouteNames.personal_information),
                        greyDivider(),
                        ItemList(
                          text: 'Payments',
                          iconImageLocation: IconPath.money,
                          route: RouteNames.payments,
                        ),
                        greyDivider(),
                        ItemList(
                            text: 'Notifications',
                            iconImageLocation: IconPath.bell,
                            route: RouteNames.notifications),
                        greyDivider(),
                        ItemList(
                            text: 'Friends',
                            iconImageLocation: IconPath.people,
                            route: RouteNames.friends),
                        greyDivider(),
                        ItemList(
                            text: 'Documents / Ids',
                            iconImageLocation: IconPath.folder,
                            route: RouteNames.documentsids),
                        greyDivider(),
                        ItemList(
                            text: 'Get Help',
                            iconImageLocation: IconPath.question,
                            route: RouteNames.gethelp),
                        greyDivider(),
                        ItemList(
                            text: 'Terms of Service',
                            iconImageLocation: IconPath.info,
                            route: RouteNames.termofservice),
                        greyDivider(),
                        ItemList(
                            text: 'Give us feedback',
                            iconImageLocation: IconPath.message,
                            route: RouteNames.feedback),
                        greyDivider(),
                        ItemList(
                          text: 'Log out',
                          iconImageLocation: IconPath.lock,
                          onTap: () => authUserStore.logout(),
                          color: Color(0xffdf8f3d),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]));
    });
  }
}
