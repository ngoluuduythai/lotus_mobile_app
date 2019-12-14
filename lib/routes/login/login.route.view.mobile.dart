import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes.dart';
import 'package:main/locator.dart';
import 'package:main/shared/store/auth_user/auth_user.store.dart';
import '../../locator.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/colors.dart';
import './login_button/login_button.dart';
import '../../shared/constants/icon_paths.dart';
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
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(820),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(40),
                    top: ScreenUtil().setHeight(90)),
                child: Image.asset(
                  Images.logo,
                  width: ScreenUtil().setWidth(146),
                  height: ScreenUtil().setHeight(90),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(40),
                    top: ScreenUtil().setHeight(10)),
                child: Text(
                  'Welcome to Lotus',
                  style: TextStyle(
                      color: Color(0xff0b0b0b),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'AirbnbCerealApp',
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil().setSp(60.0)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(40),
                      top: ScreenUtil().setHeight(10)),
                  child: Text(
                      'Find the perfect space.\nSame price. No Commitment.',
                      style: TextStyle(
                        color: Color(0xff0b0b0b).withOpacity(.64),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'AirbnbCerealApp',
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(36.0),
                      ))),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
            height: ScreenUtil().setHeight(350),
            child: Image.asset(Images.loginRoomBackground,
                width: ScreenUtil().setWidth(690)),
          ),
        ],
      ));
}

Widget _imageWoman(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(400), right: ScreenUtil().setWidth(100)),
    alignment: Alignment.topCenter,
    child: Container(
      height: ScreenUtil().setHeight(520),
      child: Image.asset(Images.loginGirl),
      width: ScreenUtil().setWidth(140),
    ),
  );
}

Widget _bottomRectable(BuildContext context) {
  SizeConfig().init(context);
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  return PositionedDirectional(
    start: 0,
    child: Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1950),
      color: AppColor.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(210),
          ),

          LoginButton(
            // Facebook Login Button
            iconImageLocation: IconPath.facebook,
            buttonText: 'Login with Facebook',
            buttonTextColor: const Color(0xFF3B5998),
            width: ScreenUtil().setWidth(695),
            height: ScreenUtil().setHeight(91),
            left: ScreenUtil().setWidth(150),
            right: ScreenUtil().setWidth(124),
            fontSize: ScreenUtil().setSp(30),
            onPressed: () async {
              final loggedIn = await authUserStore.loginFacebook();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),

          SizedBox(
            height: ScreenUtil().setHeight(24),
          ),
          //Login with linkedin
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.linkedin,
            buttonText: 'Login with LinkedIn',
            buttonTextColor: const Color(0xFF0077B5),
            width: ScreenUtil().setWidth(694),
            height: ScreenUtil().setHeight(91),
            left: ScreenUtil().setWidth(150),
            right: ScreenUtil().setWidth(142),
            fontSize: ScreenUtil().setSp(30),

            onPressed: () async {
              final loggedIn = await authUserStore.loginLinkedin(context);
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(24),
          ),
          //Continue without registration
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.google,
            buttonText: 'Login with Google',
            buttonTextColor: const Color(0xFF4C4C4C),
            width: ScreenUtil().setWidth(692),
            height: ScreenUtil().setHeight(91),
            left: ScreenUtil().setWidth(150),
            right: ScreenUtil().setWidth(156),
            fontSize: ScreenUtil().setSp(30),

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
