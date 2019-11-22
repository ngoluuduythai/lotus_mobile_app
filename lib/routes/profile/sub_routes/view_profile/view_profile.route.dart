import 'package:flutter/material.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import '../../../../locator.dart';
import '../../../../shared/constants/icon_paths.dart';
import './../../../../routes.dart';
import '../../../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../../../shared/widgets/base_widget/base_widget.dart';
import '../view_profile/verification_screen/verification_screen.dart';
import '../view_profile/item_tyler_provider.dart';
import '../view_profile/item_view_profile.dart';

class ViewProfileRoute extends StatefulWidget {
  @override
  _ViewProfileRouteState createState() => _ViewProfileRouteState();
}

class _ViewProfileRouteState extends State<ViewProfileRoute> {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  greyDivider() {
    return Container(
      child: Divider(
        color: Color(0xFFB6C1CF),
        height: 60,
        indent: 22,
        endIndent: 22,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 32, left: 10),
                  child: IconButton(
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
                ),
                Container(
                  margin: EdgeInsets.only(left: 290, top: 25),
                  child: InkWell(
                    child: Text('Edit',
                        style: TextStyle(
                          color: Color(0xff0b0b0b),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AirbnbCerealApp',
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0, left: 0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 1), width: 2),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '${authUserStore.authUser.fullName}',
                  style: TextStyle(
                    color: Color(0xff0b0b0b),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Color(0xFFB6C1CF),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 13.0,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
            width: 372,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, right: 210),
                    child: Text(
                      "Hi, i' m " '${authUserStore.authUser.firstName}',
                      style: TextStyle(
                        color: Color(0xff0b0b0b),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'AirbnbCerealApp',
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10, left: 22, right: 22),
                    child: Text(
                      'Vestibulum rutrum quam vitae fringilla tincidunt. Suspendisse nec tortor urna. Ut laoreet sodales nisi, quis iaculis nulla iaculis vitae. ',
                      style: TextStyle(
                        color: Color(0xFFB6C1CF),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'AirbnbCerealApp',
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                      ),
                    )),
                greyDivider(),
                Container(
                  margin: EdgeInsets.only(),
                  child: Container(
                      width: 330,
                      height: 44,
                      margin: EdgeInsets.only(),
                      child: FlatButton(
                        color: Color(0xFFFFBA73),
                        onPressed: () => {
                          VerificationScreen().screen(context),
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('Verify Employer',
                            style: TextStyle(
                                color: Color(0xFF733A00),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'AirbnbCerealApp',
                                fontStyle: FontStyle.normal,
                                fontSize: 16)),
                      )),
                ),
                greyDivider(),
                Container(
                  child: Column(
                    children: <Widget>[
                      ItemsViewProfile(
                        title: 'Lives in Brooklyn,NY',
                        right: 188,
                        top: 0,
                      ),
                      ItemsViewProfile(
                        title: 'Speak English',
                        right: 233,
                        top: 10,
                      ),
                      ItemsViewProfile(
                        title: 'Works at Graphic Designer',
                        right: 143,
                        top: 10,
                      ),
                    ],
                  ),
                ),
                greyDivider(),
                Container(
                    margin: EdgeInsets.only(right: 207),
                    child: Text('Tyler Provider',
                        style: TextStyle(
                          color: Color(0xFF0B0B0B),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AirbnbCerealApp',
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                        ))),
                Container(
                  child: Row(
                    children: <Widget>[
                      ItemTylerProvider(
                        iconImageLocation: IconPath.okIcon,
                        title: 'Goverment ID',
                        leftIcon: 23,
                        topIcon: 3,
                        leftTitle: 10,
                        topTitle: 3,
                      ),
                      ItemTylerProvider(
                        iconImageLocation: IconPath.okIcon,
                        title: 'Selfie',
                        leftIcon: 59,
                        topIcon: 3,
                        leftTitle: 10,
                        topTitle: 3,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      ItemTylerProvider(
                        iconImageLocation: IconPath.okIcon,
                        title: 'Email Adress',
                        leftIcon: 22,
                        topIcon: 3,
                        leftTitle: 10,
                        topTitle: 3,
                      ),
                      ItemTylerProvider(
                        iconImageLocation: IconPath.okIcon,
                        title: 'Phone Number',
                        leftIcon: 69,
                        topIcon: 3,
                        leftTitle: 10,
                        topTitle: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
    });
  }
}
