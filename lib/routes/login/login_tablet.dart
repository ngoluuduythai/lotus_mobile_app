import 'package:flutter/material.dart';
import './login_button/login_button.dart';
import '../routes.dart';
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
            _topRectable(context),
            _bottomRectable(context),
            _imageWoman(context),
          ],
        ),
      );
    });
  }
}

Widget _topRectable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double h = size.height * 3 / 5;
  return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 40, right: 44, top: 40),
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

Widget _imageWoman(BuildContext context) {
  return Container(
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.only(left: 20, right: 65),
    padding: new EdgeInsets.only(
      top: 250,
      right: 20.0,
      left: 20.0,
      bottom: 20,
    ),
    child: new Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: new Image.asset(Images.loginGirl),
    ),
  );
}

Widget _bottomRectable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double topH = size.height * 3 / 5;
  double h = size.height - topH;
  final AuthUserStore authUserStore = locator<AuthUserStore>();
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
            height: 30,
          ),
          LoginButton(
            // Facebook Login Button
            iconImageLocation: IconPath.facebook,
            buttonText: 'Login with Facebook',
            buttonTextColor: const Color(0xFF3B5998),
            width: 450,
            height: 55,
            left: 90,
            right: 83,
            fontSize: 20,
            onPressed: () async {
              final loggedIn = await authUserStore.loginFacebook();
              if (loggedIn) {
                Routes.sailor(RouteNames.profile);
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          LoginButton(
            // Instagram Login Button
            iconImageLocation: IconPath.instagram,
            buttonText: 'Login with Instagram',
            buttonTextColor: const Color(0xFF323332),
            width: 450,
            height: 55,
            left: 90,
            right: 80,
            fontSize: 20,
            onPressed: () async {
              // final loggedIn = await authUserStore.loginInstagram();
              // if(loggedIn){
              //   Routes.sailor(RouteNames.profile);
              // }
            },
          ),
          SizedBox(
            height: 10,
          ),
          //Login with linkedin
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.linkedin,
            buttonText: 'Login with LinkedIn',
            buttonTextColor: const Color(0xFF0077B5),
            width: 450,
            height: 55,
            left: 90,
            right: 96,
            fontSize: 20,
            onPressed: () async {
              // final loggedIn = await authUserStore.loginInstagram();
              // if(loggedIn){
              //   Routes.sailor(RouteNames.profile);
              // }
            },
          ),
          SizedBox(
            height: 10,
          ),
          //Continue without registration
          LoginButton(
            // Linkedin Login Button
            iconImageLocation: IconPath.google,
            buttonText: 'Login with Google',
            buttonTextColor: const Color(0xFF4C4C4C),
            width: 450,
            height: 55,
            left: 90,
            right: 107,
            fontSize: 20,
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
