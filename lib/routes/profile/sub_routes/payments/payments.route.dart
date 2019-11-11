import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:main/shared/constants/icon_paths.dart';
import 'package:main/shared/widgets/base_widget/base_widget.dart';
import 'package:main/shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../../../routes.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import 'package:main/locator.dart';

class PaymentsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 43, left: 19),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 120),
                          child: Text(
                            'Payments',
                            style: TextStyle(
                              color: Color(0xff0b0b0b),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'AirbnbCerealApp',
                              fontStyle: FontStyle.normal,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                      ])
                ])),
        Container(
            margin: EdgeInsets.only(left: 21, right: 21, top: 50, bottom: 30),
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(21))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 34, left: 20, right: 30),
                  child: Column(children: <Widget>[
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.54,
                          fontFamily: 'AirbnbCerealApp'),
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 20, right: 21),
                  child: Text(
                      'Connect your bank account to pay rent and to substitute proof of income and employment documents.',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'AirbnbCerealApp',
                          letterSpacing: -0.48)),
                ),
                Container(
                    child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: 21, left: 20.7, right: 20.7, bottom: 35),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(243, 244, 248, 100),
                                width: 2)),
                        child: Column(children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    left: 21, right: 21, top: 21, bottom: 34),
                                height: 39,
                                width: 55,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(182, 193, 207, 0.21),
                                        width: 2),
                                    color: Color.fromRGBO(182, 193, 207, 0.21),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Image.asset(
                                        IconPath.dollarCashGrey,
                                        width: 25,
                                        height: 16,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20, left: 21, right: 30, bottom: 43),
                              child: Text('Your Account',
                                  style: TextStyle(
                                    color: Color.fromRGBO(182, 193, 207, 100),
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'AirbnbCerealApp',
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 43),
                              child: IconButton(
                                icon: Image.asset(
                                  IconPath.block,
                                  width: 25,
                                  height: 16,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ]),
                          Container(
                              width: 288,
                              height: 44,
                              margin: EdgeInsets.only(bottom: 21),
                              child: RaisedButton(
                                color: Color.fromRGBO(255, 186, 115, 1),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Add New Bank',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'AirbnbCerealApp')),
                              ))
                        ]),
                      )
                    ],
                  ),
                ])),
                Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            child: Text(
                          'Max. Monthly Spend',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              fontFamily: 'AirbnbCerealApp'),
                        )),
                        Container(
                            child: OutlineButton(
                          child: Text(
                            'Payment History',
                            style: TextStyle(
                                color: Color.fromRGBO(223, 143, 61, 1)),
                          ),
                          onPressed: () {
                            print('ASD');
                          }, //callback when button is clicked
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          highlightedBorderColor: Colors.white,
                          borderSide: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 0.8, //width of the border
                          ),
                        ))
                      ],
                    )),
                Container(
                    child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 325,
                        margin:
                            EdgeInsets.only(top: 21, left: 20.7, bottom: 35),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(243, 244, 248, 100),
                                width: 2)),
                        child: Row(children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(
                                  left: 21, right: 21, top: 21, bottom: 34),
                              height: 40,
                              width: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromRGBO(182, 193, 207, 0.21),
                                      width: 2),
                                  color: Color.fromRGBO(182, 193, 207, 0.21),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Image.asset(
                                      IconPath.dollarCashGreen,
                                      width: 25,
                                      height: 16,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(
                                top: 21, left: 21, right: 16, bottom: 20),
                            child: Text('\$2000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'AirbnbCerealApp',
                                )),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 21, top: 21, bottom: 34),
                              height: 39,
                              width: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromRGBO(182, 193, 207, 0.21),
                                      width: 2),
                                  color: Color.fromRGBO(182, 193, 207, 0.21),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('USD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ],
                              ))
                        ]),
                      ),
                    ],
                  ),
                ])),
                Container(
                  color: Colors.white,
                  width: size.width,
                  padding: EdgeInsets.only(left: 20, right: 30, bottom: 20),
                  child: Text(
                      'Keep track of your expenses and access your payment history.',
                      style: TextStyle(
                          color: Color.fromRGBO(61, 71, 92, 44),
                          fontSize: 16,
                          fontFamily: 'AirbnbCerealApp',
                          letterSpacing: -0.48)),
                ),
                Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(21),
                            bottomRight: Radius.circular(21))),
                    padding: EdgeInsets.only(
                        top: 10, left: 20, right: 30, bottom: 24),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 229, 202, 100),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: <Widget>[
                          Container(
                              child: IconButton(
                            icon: Image.asset(
                              IconPath.info,
                              width: 14,
                              height: 17,
                              color: Color.fromRGBO(223, 143, 61, 100),
                            ),
                            onPressed: () {},
                          )),
                          Text('This value is only seen by you!',
                              style: TextStyle(
                                  color: Color.fromRGBO(223, 143, 61, 100),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'AirbnbCerealApp',
                                  letterSpacing: -0.48))
                        ],
                      ),
                    ))
              ],
            ))
      ])));
    });
  }
}
