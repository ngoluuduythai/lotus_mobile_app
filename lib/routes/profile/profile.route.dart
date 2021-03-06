import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes.dart';
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
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20),
                  top: ScreenUtil().setHeight(30),
                  bottom: ScreenUtil().setHeight(30)),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(255, 186, 115, 0.55),
                                  width: ScreenUtil().setWidth(4.5)),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(
                                      '${authUserStore.authUser.profilePictureUrl}') //eventually going to use facebook url
                                  )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(40),
                              bottom: ScreenUtil().setHeight(2)),
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
                                            fontSize: ScreenUtil().setSp(42.0),
                                          ))),
                              SizedBox(
                                height: ScreenUtil().setWidth(8),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(183)),
                                child: InkWell(
                                  child: Text(
                                    'View profile',
                                    style: TextStyle(
                                      color: Color(0xFFDF8F3D),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'AirbnbCerealApp',
                                      fontStyle: FontStyle.normal,
                                      fontSize: ScreenUtil().setSp(34.0),
                                    ),
                                  ),
                                  onTap: () => Routes.sailor
                                      .navigate(RouteNames.viewprofile),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(45)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20),
                              left: ScreenUtil().setWidth(5),
                              right: ScreenUtil().setWidth(120),
                              bottom: ScreenUtil().setHeight(15)),
                          width: ScreenUtil().setWidth(510),
                          height: ScreenUtil().setHeight(50),
                          child: Text(
                            'Account Settings',
                            style: TextStyle(
                              color: Color(0xff0b0b0b),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'AirbnbCerealApp',
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(42.0),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: ScreenUtil().setHeight(6),
                          indent: ScreenUtil().setWidth(40),
                          endIndent: ScreenUtil().setWidth(590),
                          color: Color(0xFFFFBA73),
                        ),
                        ItemList(
                          text: 'Payments',
                          iconImageLocation: IconPath.money,
                          route: RouteNames.payments,
                        ),
                        greyDivider(),
                        ItemList(
                            text: 'Settings',
                            iconImageLocation: IconPath.settings,
                            route: RouteNames.settings),
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
