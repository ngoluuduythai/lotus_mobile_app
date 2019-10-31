import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/shared/widgets/itemlist_profile/itemlist_profile.dart';
import 'package:sailor/sailor.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';

class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  static final sailor = Sailor();
  @override
  Widget build(BuildContext context) {
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
                                      'https://picsum.photos/250?image=9') //eventually going to use facebook url
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
                                margin: EdgeInsets.only(right: 90),
                                child: InkWell(
                                  child: Text(
                                    'View profile',
                                    style: TextStyle(
                                      color: Colors.amber[700],
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'AirbnbCerealApp',
                                      fontStyle: FontStyle.normal,
                                      fontSize: 17.0,
                                      shadows: [
                                        Shadow(
                                            // bottomLeft
                                            offset: Offset(-0.01, -0.01),
                                            color: Colors.black),
                                        Shadow(
                                            // bottomRight
                                            offset: Offset(0.01, -0.01),
                                            color: Colors.black),
                                        Shadow(
                                            // topRight
                                            offset: Offset(0.01, 0.01),
                                            color: Colors.black),
                                        Shadow(
                                            // topLeft
                                            offset: Offset(-0.01, 0.01),
                                            color: Colors.black),
                                      ],
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
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    width: 372,
                    height: 644,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 120),
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
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.amber[600],
                          height: 1,
                          indent: 25,
                          endIndent: 307,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Personal Information',
                          iconImageLocation: 'assets/images/5H.png',
                          onTap: () => Routes.sailor
                              .navigate(RouteNames.personal_information),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Payments',
                          iconImageLocation: 'assets/images/8B.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.payments),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Notifications',
                          iconImageLocation: 'assets/images/Shape.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.notifications),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Friends',
                          iconImageLocation: 'assets/images/5F.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.friends),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Documents / Ids',
                          iconImageLocation: 'assets/images/6H.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.documentsids),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Get Help',
                          iconImageLocation: 'assets/images/1B.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.gethelp),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Terms of Service',
                          iconImageLocation: 'assets/images/7B.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.termofservice),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Give us feedback',
                          iconImageLocation: 'assets/images/4H.png',
                          onTap: () =>
                              Routes.sailor.navigate(RouteNames.feedback),
                          color: Color(0xff0b0b0b),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ItemListProfile(
                          text: 'Log out',
                          iconImageLocation: 'assets/images/3F.png',
                          onTap: () => authUserStore.logout(),
                          color: Color(0xffdf8f3d),
                        ),
                        SizedBox(
                          height: 20,
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
