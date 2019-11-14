import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/shared/constants/env.dart';

import '../../routes.dart';
import '../../locator.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/colors.dart';
import './login_button/login_button.dart';
import '../../shared/constants/icon_paths.dart';
import 'linkedin_view/linkedin_view.dart';
import '../../utils/sizeConfig.dart';

class LoginRouteMobilePortrait extends StatelessWidget {
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
  SizeConfig().init(context);
  return Container(
      color: Colors.white,
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 62,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 5,
                    top: SizeConfig.blockSizeVertical * 5),
                child: Image.asset(
                  Images.logo,
                  width: 73,
                  height: 45,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 5,
                    top: SizeConfig.blockSizeVertical),
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
                  margin: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 6,
                      top: SizeConfig.blockSizeVertical),
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
            margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 8),
            width: SizeConfig.safeBlockHorizontal * 87,
            child: Image.asset(Images.loginRoomBackground,
                width: SizeConfig.safeBlockHorizontal * 70),
          ),
        ],
      ));
}

Widget _imageWoman(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    margin: EdgeInsets.only(top:SizeConfig.safeBlockVertical*30 ),
    alignment: Alignment.topCenter,
    child: Container(
      height: SizeConfig.safeBlockVertical * 40,
      width: SizeConfig.safeBlockHorizontal * 19,
      child: Image.asset(Images.loginGirl),
    ),
  );
}

Widget _bottomRectable(BuildContext context) {
  SizeConfig().init(context);
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  return PositionedDirectional(
    start: 0,
    child: Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 150,
      color: AppColor.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: SizeConfig.safeBlockVertical * 18,
          ),

          LoginButton(
            // Facebook Login Button
            iconImageLocation: IconPath.facebook,
            buttonText: 'Login with Facebook',
            buttonTextColor: const Color(0xFF3B5998),
            width: SizeConfig.safeBlockHorizontal * 93,
            height: SizeConfig.safeBlockVertical * 7,
            left: SizeConfig.safeBlockHorizontal * 20,
            right: SizeConfig.safeBlockHorizontal * 16,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            onPressed: () async {
              final loggedIn = await authUserStore.loginFacebook();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),

          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          //Login with linkedin
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.linkedin,
            buttonText: 'Login with LinkedIn',
            buttonTextColor: const Color(0xFF0077B5),
            width: SizeConfig.safeBlockHorizontal * 93,
            height: SizeConfig.safeBlockVertical * 7,
            left: SizeConfig.safeBlockHorizontal * 20,
            right: SizeConfig.safeBlockHorizontal * 19,
            fontSize: SizeConfig.safeBlockHorizontal * 4,

            onPressed: () async {
              // FIXME refactor: move to another place
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                        appBar: AppBar(
                          leading: CloseButton(),
                        ),
                        body: LinkedInLogin(
                          clientId: ENV.linkedinAppID, // FIXME hardcoding
                          redirectUrl: ENV.linkedinRedirectUrl,
                          onError: (String error) {
                            print(error);
                          },
                          onAuthCode: (authCode) async {
                            print('authCode');
                            print(authCode);
                            final loggedIn =
                                await authUserStore.loginLinkedin(authCode);
                            print('loggedIn');
                            print(loggedIn);
                            if (loggedIn) {
                              print('loggedIn if');
                              Navigator.pop(context);
                              Routes.sailor(RouteNames.profile);
                            }
                          },
                        ))),
              );
            },
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          //Continue without registration
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.google,
            buttonText: 'Login with Google',
            buttonTextColor: const Color(0xFF4C4C4C),
            width: SizeConfig.safeBlockHorizontal * 93,
            height: SizeConfig.safeBlockVertical * 7,
            left: SizeConfig.safeBlockHorizontal * 20,
            right: SizeConfig.safeBlockHorizontal * 21,
            fontSize: SizeConfig.safeBlockHorizontal * 4,

            onPressed: () async {
              final loggedIn = await authUserStore.loginGoogle();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
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
