import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/shared/constants/colors.dart';
import './login_button/login_button.dart';

import '../../routes.dart';
import '../../locator.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/icon_paths.dart';

class LoginRouteTablet extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Material(
        child: Stack(
          children: <Widget>[
            _bottomRectable(context),
            _topRectable(context),
            _imageWoman(context),
          ],
        ),
      );
    });
  }
}

Widget _topRectable(BuildContext context) {
  return Container(
      color: Colors.white,
      width: ScreenUtil().scaleWidth * 750,
      height: ScreenUtil().scaleHeight * 770,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(60),
                    top: ScreenUtil().scaleHeight * 100),
                child: Image.asset(
                  Images.logo,
                  width: 73,
                  height: 45,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(59),
                    top: ScreenUtil().scaleHeight * 15),
                child: Text(
                  'Welcome to Lotus',
                  style: TextStyle(
                      color: Color(0xff0b0b0b),
                      fontWeight: FontWeight.w700,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil().scaleHeight * 50),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(60),
                      top: ScreenUtil().scaleHeight * 15),
                  child: Text(
                      'Find the perfect space.\nSame price. No Commitment.',
                      style: TextStyle(
                        color: Color(0xff0b0b0b).withOpacity(.64),
                        fontWeight: FontWeight.w500,
                        fontFamily: "AirbnbCerealApp",
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().scaleHeight * 30,
                      ))),
            ],
          ),
          Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  top: ScreenUtil().scaleHeight * 40),
              height: ScreenUtil().scaleHeight * 370,
              child: Image.asset(
                Images.loginRoomBackground,
                // fit: BoxFit.contain,
                width: ScreenUtil().scaleWidth * 700,
                height: ScreenUtil().scaleHeight * 350,
              )),
        ],
      ));
}

Widget _imageWoman(BuildContext context) {
  // SizeConfig().init(context);
  return Container(
    margin: EdgeInsets.only(
        top: ScreenUtil().scaleHeight * 390,
        right: ScreenUtil().scaleWidth * 50),
    alignment: Alignment.topCenter,
    child: Container(
      height: ScreenUtil().scaleHeight * 450,
      // width: SizeConfig.safeBlockHorizontal * 19,
      width: ScreenUtil().scaleHeight * 250,
      child: Image.asset(Images.loginGirl),
    ),
  );
}

Widget _bottomRectable(BuildContext context) {
  // SizeConfig().init(context);
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  return PositionedDirectional(
    start: 0,
    child: Container(
      width: ScreenUtil().scaleWidth * 750,
      height: ScreenUtil().scaleHeight * 1334,
      color: AppColor.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          LoginButton(
            // Facebook Login Button
            iconImageLocation: IconPath.facebook,
            buttonText: 'Login with Facebook',
            buttonTextColor: const Color(0xFF3B5998),
            width: ScreenUtil().setWidth(640),
            height: ScreenUtil().setHeight(90),
            left: ScreenUtil().setWidth(130),
            right: 0,
            fontSize: ScreenUtil().setWidth(29),
            onPressed: () async {
              final loggedIn = await authUserStore.loginFacebook();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),

          SizedBox(
            height: ScreenUtil().setHeight(25),
          ),

          //Login with instagram
          LoginButton(
            // Instagram Login Button
            iconImageLocation: IconPath.instagram,
            buttonText: 'Login with Instagram',
            buttonTextColor: const Color(0xFF323332),
             width: ScreenUtil().setWidth(640),
            height: ScreenUtil().setHeight(90),
            left: ScreenUtil().setWidth(130),
            right: 0,
            fontSize: ScreenUtil().setWidth(29),
            onPressed: () async {
              // final loggedIn = await authUserStore.loginInstagram();
              // if(loggedIn){
              //   Routes.sailor(RouteNames.profile);
              // }
            },
          ),

          SizedBox(
            height: ScreenUtil().setHeight(25),
          ),

          //Login with linkedin
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.linkedin,
            buttonText: 'Login with LinkedIn',
            buttonTextColor: const Color(0xFF0077B5),
            width: ScreenUtil().setWidth(640),
            height: ScreenUtil().setHeight(90),
            left: ScreenUtil().setWidth(130),
            right: 0,
            fontSize: ScreenUtil().setWidth(29),

            onPressed: () async {
              final loggedIn = await authUserStore.loginLinkedin(context);
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(25),
          ),
          //Continue without registration
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.google,
            buttonText: 'Login with Google',
            buttonTextColor: const Color(0xFF4C4C4C),
            width: ScreenUtil().setWidth(640),
            height: ScreenUtil().setHeight(90),
            left: ScreenUtil().setWidth(130),
            right: 0,
            fontSize: ScreenUtil().setWidth(29),

            onPressed: () async {
              final loggedIn = await authUserStore.loginGoogle();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40.0),
          ),
        ],
      ),
    ),
  );
}

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
