import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../routes.dart';
import '../../locator.dart';
import '../../shared/widgets/facebook_button/facebook_button.dart';
import '../../shared/widgets/linkedin_button/linkedin_button.dart';
import '../../shared/widgets/google_button/google_button.dart';
import '../../shared/widgets/instagram_button/instagram_button.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import '../../shared/constants/images.dart';

part 'login.route.view.mobile.g.dart';

class LoginRouteMobilePortrait extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Material(
        child: Stack(
          children: <Widget>[
            _BottomRectable(),
            _TopRectable(),
            _ImageWoman(),
          ],
        ),
      );
    });
  }
}

class LoginRouteMobileLandscape extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Material(
        child: Stack(
          children: <Widget>[
            _BottomRectable(),
            _TopRectable(),
            _ImageWoman(),
          ],
        ),
      );
    });
  }
}

@widget
Widget _topRectable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double h = size.height * 3 / 5;
  return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 40, right: 44, top: 35),
      width: size.width,
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 17),
                child: Image.asset(
                  Images.logo,
                  width: 73,
                  height: 45,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Welcome to Lotus',
                  style: TextStyle(
                      color: Color(0xff0b0b0b),
                      fontWeight: FontWeight.w700,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle: FontStyle.normal,
                      fontSize: 30.0),
                ),
              ),
              Container(
                  child: Text(
                      'Find the perfect space.\nSame price. No Commitment.',
                      style: TextStyle(
                        color: Color(0xff0b0b0b).withOpacity(.64),
                        fontWeight: FontWeight.w500,
                        fontFamily: "AirbnbCerealApp",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                      ))),
            ],
          ),
          Container(
            alignment: Alignment(0, 0),
            child: Image.asset(Images.loginRoomBackground),
          ),
        ],
      ));
}

@widget
Widget _imageWoman(BuildContext context) {
  return Container(
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.only(left: 20, right: 65),
    padding: new EdgeInsets.only(
      top: 210,
      right: 20.0,
      left: 20.0,
      bottom: 20,
    ),
    child: new Container(
      height: 230.0,
      width: MediaQuery.of(context).size.width,
      child: new Image.asset(Images.loginGirl),
    ),
  );
}

@widget
Widget _bottomRectable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double topH = size.height * 3 / 5;
  double h = size.height - topH;

  return PositionedDirectional(
    top: topH,
    start: 0,
    child: Container(
      width: size.width,
      height: h,
      color: Color(0xffffba73),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          FacebookButton(
            afterLogin: () {
              Routes.sailor(RouteNames.profile);
            },
          ),
          SizedBox(
            height: 10,
          ),
          InstagramButton(
            afterLogin: () {
              Routes.sailor(RouteNames.profile);
            },
          ),
          SizedBox(
            height: 10,
          ),
          //Login with linkedin
          LinkedinButton(
            afterLogin: () {
              Routes.sailor(RouteNames.profile);
            },
          ),

          SizedBox(
            height: 10,
          ),
          //Continue without registration
          GoogleButton(
            afterLogin: () {
              Routes.sailor(RouteNames.profile);
            },
          ),
        ],
      ),
    ),
  );
}

@widget
Widget _welcome(BuildContext context) {
  return PositionedDirectional(
      top: 129,
      start: 42,
      child: Text(
        'Welcome to Lotus',
        style: TextStyle(
            color: const Color(0xff0b0b0b),
            fontWeight: FontWeight.w700,
            fontFamily: "AirbnbCerealApp",
            fontStyle: FontStyle.normal,
            fontSize: 30.0),
      ));
}
