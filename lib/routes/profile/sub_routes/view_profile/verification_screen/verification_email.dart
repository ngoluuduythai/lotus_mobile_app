import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../shared/constants/images.dart';
import '../../../../routes.dart';

class VerificationEmailScreen {
  VerificationEmailScreen({this.email});
  String email;

  void screen(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
              body: ListView(children: <Widget>[
            Container(
                width: ScreenUtil().setWidth(433),
                height: ScreenUtil().setHeight(1300),
                decoration: BoxDecoration(color: Color(0xfff5f6fa)),
                child: Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(180),
                      left: ScreenUtil().setWidth(52),
                      right: ScreenUtil().setWidth(52),
                      bottom: ScreenUtil().setHeight(280)),
                  width: ScreenUtil().setWidth(372),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(100)),
                          child: Center(
                            child: Image.asset(
                              Images.verificationEmailScreen,
                              width: ScreenUtil().setWidth(450),
                              height: ScreenUtil().setHeight(300),
                              alignment: Alignment.topCenter,
                            ),
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                          child: Center(
                            child: Text('Email Sent',
                                style: TextStyle(
                                  color: Color(0xFF0B0B0B),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontStyle: FontStyle.normal,
                                  fontSize: ScreenUtil().setSp(38),
                                )),
                          )),
                      Container(
                          width: ScreenUtil().setWidth(520),
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(25),
                              left: ScreenUtil().setWidth(40),
                              right: ScreenUtil().setWidth(40)),
                          child: Center(
                            child: Text(
                              'Verification email sent to $email, please check your email and click the verification link',
                              style: TextStyle(
                                color: Color(0xFF484F61),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AirbnbCerealApp',
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil().setSp(25),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Column(
                        children: <Widget>[
                          Container(
                              width: ScreenUtil().setWidth(560),
                              height: ScreenUtil().setHeight(68),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(180),
                                  left: ScreenUtil().setWidth(0)),
                              child: FlatButton(
                                color: Color(0xFFFFBA73),
                                onPressed: () => {
                                  Routes.sailor.navigate(RouteNames.viewprofile)
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Back to my profile',
                                    style: TextStyle(
                                        color: Color(0xFF733A00),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'AirbnbCerealApp',
                                        fontStyle: FontStyle.normal,
                                        fontSize: ScreenUtil().setSp(32))),
                              ))
                        ],
                      ),
                    ],
                  ),
                ))
          ]));
        });
  }
}
