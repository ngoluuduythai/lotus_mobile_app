import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:main/routes/profile/sub_routes/view_profile/verification_screen/item_verification.dart';
import 'package:main/routes/profile/sub_routes/view_profile/verification_screen/textitem_verification.dart';
import '../../../../../locator.dart';
import '../../../../../shared/constants/images.dart';
import '../../../../../shared/constants/icon_paths.dart';
import '../../../../routes.dart';
import '../../../../../shared/store/auth_user/auth_user.store.dart';
import 'verification_email.dart';

class VerificationScreen {
  void screen(BuildContext context) {
    final AuthUserStore authUserStore = locator<AuthUserStore>();
    final _formKey = GlobalKey<FormState>();
    String employerEmail;
    int income;
    double parsed;

    final controllerIncome = MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ',', precision: 2);

    final controllerEmail = TextEditingController(text: 'myemail@gmail.com');

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
                      top: ScreenUtil().setHeight(50),
                      left: ScreenUtil().setWidth(52),
                      right: ScreenUtil().setWidth(52),
                      bottom: ScreenUtil().setHeight(80)),
                  width: ScreenUtil().setWidth(372),
                  height: ScreenUtil().setHeight(425),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                              left: 0,
                              top: ScreenUtil().setHeight(48),
                              right: ScreenUtil().setWidth(520)),
                          child: GestureDetector(
                            child: Tab(
                              icon: Image.asset(
                                IconPath.crossBlack,
                                width: ScreenUtil().setWidth(48),
                                height: ScreenUtil().setHeight(48),
                              ),
                            ),
                            onTap: () => {
                              Routes.sailor.navigate(RouteNames.viewprofile)
                            },
                          )),
                      Container(
                          margin: EdgeInsets.only(),
                          child: Center(
                            child: Image.asset(
                              Images.verificationScreen,
                              width: ScreenUtil().setWidth(500),
                              height: ScreenUtil().setHeight(320),
                              alignment: Alignment.topCenter,
                            ),
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(45)),
                          child: Center(
                            child: Text('Employeer Verification',
                                style: TextStyle(
                                  color: Color(0xFF0B0B0B),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontStyle: FontStyle.normal,
                                  fontSize: ScreenUtil().setSp(42),
                                )),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(25),
                              left: ScreenUtil().setWidth(40),
                              right: ScreenUtil().setWidth(40)),
                          child: Center(
                            child: Text(
                              'We will send your employee email a link so you can verify your employment, we will not contact you employer. We use the expected income in order to determine your max monthly payment',
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
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextItemVerification(
                              right: ScreenUtil().setWidth(403),
                              left: 0,
                              top: ScreenUtil().setHeight(30),
                              title: 'Your Email',
                              size: ScreenUtil().setSp(32),
                            ),
                            ItemVerification(
                                left: ScreenUtil().setWidth(42),
                                right: ScreenUtil().setWidth(44),
                                onChanged: (val) {
                                  employerEmail = val;
                                  print(employerEmail);
                                },
                                onFieldSubmitted: (val) {
                                  employerEmail = val;
                                  print(employerEmail);
                                },
                                controller: controllerEmail,
                                validator: (value) {
                                  if (!EmailValidator.validate(value) ||
                                      value == ('myemail@gmail.com')) {
                                    return 'You must specify a valid email';
                                  }
                                  return null;
                                }),
                            TextItemVerification(
                              right: ScreenUtil().setWidth(110),
                              top: ScreenUtil().setHeight(30),
                              left: 0,
                              title: 'Expected Income for the year',
                              size: ScreenUtil().setSp(32),
                            ),
                            Row(children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(42)),
                                child: Text(
                                  '\$',
                                  style: TextStyle(
                                    color: Color(0xFF484F61),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: ScreenUtil().setSp(42),
                                  ),
                                ),
                              ),
                              ItemVerification(
                                width: ScreenUtil().setWidth(540),
                                left: 0,
                                right: 0,
                                keyboardType: TextInputType.number,
                                onChanged: (val) {
                                  print(val);
                                  controllerIncome.text = val;
                                  print(controllerIncome.value);
                                },
                                onFieldSubmitted: (val) {
                                  print(val);
                                  controllerIncome.text = val;
                                  print(income);
                                },
                                controller: controllerIncome,
                                validator: (value) {
                                  if (value == '0.00') {
                                    return 'You must specify an income';
                                  }
                                  return null;
                                },
                              ),
                            ]),
                            Container(
                                width: ScreenUtil().setWidth(550),
                                height: ScreenUtil().setHeight(68),
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(30),
                                    left: ScreenUtil().setWidth(10)),
                                child: FlatButton(
                                  color: Color(0xFFFFBA73),
                                  onPressed: () => {
                                    parsed = controllerIncome.numberValue,
                                    income = parsed.toInt(),
                                    if (_formKey.currentState.validate())
                                      {
                                        authUserStore.verifyEmployerApi(
                                            employerEmail, income),
                                        VerificationEmailScreen(
                                                email: employerEmail)
                                            .screen(context),
                                      }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text('Apply',
                                      style: TextStyle(
                                          color: Color(0xFF733A00),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'AirbnbCerealApp',
                                          fontStyle: FontStyle.normal,
                                          fontSize: ScreenUtil().setSp(32))),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ]));
        });
  }
}
