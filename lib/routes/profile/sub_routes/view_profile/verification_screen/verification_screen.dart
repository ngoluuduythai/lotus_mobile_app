import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:main/routes/profile/sub_routes/view_profile/verification_screen/item_verification.dart';
import 'package:main/routes/profile/sub_routes/view_profile/verification_screen/textitem_verification.dart';
import '../../../../../locator.dart';
import '../../../../../shared/constants/images.dart';
import '../../../../../shared/constants/icon_paths.dart';
import './../../../../../routes.dart';
import '../../../../../shared/store/auth_user/auth_user.store.dart';

class VerificationScreen {
  void screen(BuildContext context) {
    final AuthUserStore authUserStore = locator<AuthUserStore>();

    String employerEmail;
    int income;
    final controllerIncome = MoneyMaskedTextController(
        decimalSeparator: '.',
        thousandSeparator: ',',
        initialValue: 40000,
        precision: 2);

    final controllerEmail = TextEditingController(text: 'myemail@gmail.com');

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
              body: ListView(children: <Widget>[
            Container(
                width: 413,
                height: 780,
                decoration: BoxDecoration(color: Color(0xfff5f6fa)),
                child: Container(
                  margin:
                      EdgeInsets.only(top: 40, left: 32, right: 32, bottom: 50),
                  width: 372,
                  height: 425,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 0, top: 15, right: 270),
                          child: GestureDetector(
                            child: Tab(
                              icon: Image.asset(
                                IconPath.crossBlack,
                                width: 24,
                                height: 24,
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
                              Images.vsImage,
                              width: 251,
                              height: 190,
                              alignment: Alignment.topCenter,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Center(
                            child: Text('Employeer Verification',
                                style: TextStyle(
                                  color: Color(0xFF0B0B0B),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.0,
                                )),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                          child: Center(
                            child: Text(
                              'We will send your employee email a link so you can verify your employment, we will not contact you employer. We use the expected income in order to determine your max monthly payment',
                              style: TextStyle(
                                color: Color(0xFF484F61),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AirbnbCerealApp',
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Column(
                        children: <Widget>[
                          TextItemVerification(
                            right: 220,
                            left: 0,
                            top: 20,
                            title: 'Your Email',
                            size: 16,
                          ),
                          ItemVerification(
                            left: 21,
                            right: 22,
                            onChanged: (val) {
                              employerEmail = val;
                              print(employerEmail);
                            },
                            onFieldSubmitted: (val) {
                              employerEmail = val;
                              print(employerEmail);
                            },
                            initialValue: 'myemail@gmail.com',
                            controllerEmail: controllerEmail,
                            isController: false,
                          ),
                          TextItemVerification(
                            right: 81,
                            top: 20,
                            left: 0,
                            title: 'Expected Income for the year',
                            size: 16,
                          ),
                          Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              child: Text(
                                '\$',
                                style: TextStyle(
                                  color: Color(0xFF484F61),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 21.0,
                                ),
                              ),
                            ),
                            ItemVerification(
                              width: 290,
                              left: 0,
                              right: 0,
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                print(val);
                                income = int.parse(val);
                                print(income);
                              },
                              onFieldSubmitted: (val) {
                                print(val);
                                income = int.parse(val);
                                print(income);
                              },
                              initialValue: '40000',
                              controllerIncome: controllerIncome,
                              isController: true,
                            ),
                          ]),
                          Container(
                              width: 310,
                              height: 44,
                              margin: EdgeInsets.only(top: 20),
                              child: FlatButton(
                                color: Color(0xFFFFBA73),
                                onPressed: () => {
                                  print(employerEmail),
                                  print(income),
                                  authUserStore.verifyEmployerApi(
                                      employerEmail, 3241)
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Apply',
                                    style: TextStyle(
                                        color: Color(0xFF733A00),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'AirbnbCerealApp',
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16)),
                              )),
                        ],
                      ),
                    ],
                  ),
                ))
          ]));
        });
  }
}
