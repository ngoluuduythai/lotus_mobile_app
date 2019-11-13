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
      height: SizeConfig.safeBlockVertical * 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset(
                  Images.logo,
                  width: 73,
                  height: 45,
                ),
              ),
              Container(
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
            child: Image.asset(Images.loginRoomBackground),
          ),
        ],
      ));
}

Widget _imageWoman(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    alignment: Alignment.topCenter,
  
    child: Container(
      height: SizeConfig.safeBlockVertical  *100,
      width: SizeConfig.safeBlockHorizontal * 20,
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
      width: SizeConfig.safeBlockHorizontal *100,
      height: SizeConfig.safeBlockVertical*150,
      color: AppColor.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: SizeConfig.safeBlockVertical*20,
          ),
          LoginButton(
            // Facebook Login Button
            iconImageLocation: IconPath.facebook,
            buttonText: 'Login with Facebook',
            buttonTextColor: const Color(0xFF3B5998),
            width: SizeConfig.safeBlockHorizontal*90,
            height: SizeConfig.safeBlockVertical*7,
            left: SizeConfig.safeBlockHorizontal*15,
            right: SizeConfig.safeBlockHorizontal*15,
            fontSize: SizeConfig.safeBlockHorizontal*4,
            onPressed: () async {
              final loggedIn = await authUserStore.loginFacebook();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),
        
        
          SizedBox(
            height: SizeConfig.safeBlockVertical,
          ),
          //Login with linkedin
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.linkedin,
            buttonText: 'Login with LinkedIn',
            buttonTextColor: const Color(0xFF0077B5),
             width: SizeConfig.safeBlockHorizontal*90,
             height: SizeConfig.safeBlockVertical*7,
            left: SizeConfig.safeBlockHorizontal*15,
            right: SizeConfig.safeBlockHorizontal*15,
            fontSize: SizeConfig.safeBlockHorizontal*4,
            
            
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
            height: SizeConfig.safeBlockVertical,
          ),
          //Continue without registration
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.google,
            buttonText: 'Login with Google',
            buttonTextColor: const Color(0xFF4C4C4C),
            width: SizeConfig.safeBlockHorizontal*90,
            height: SizeConfig.safeBlockVertical*7,
            left: SizeConfig.safeBlockHorizontal*15,
            right: SizeConfig.safeBlockHorizontal*15,
            fontSize: SizeConfig.safeBlockHorizontal*4,
            
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
