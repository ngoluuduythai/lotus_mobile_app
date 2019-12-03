import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main/routes/profile/sub_profile_base/sub_profile_base.dart';
import 'package:main/shared/constants/icon_paths.dart';
import 'package:main/shared/widgets/base_widget/base_widget.dart';
import 'package:main/shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import 'package:main/locator.dart';

class PaymentsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  @override
  Widget build(BuildContext context) {
    print("testing");
    authUserStore.getFinancialInstitutions().then((data) {
      print('data');
      print(authUserStore.authUser.monthlyRentalBudget);
    });
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: SubProfileBase(
        name: 'Payments',
        child: _payments(context),
      ));
    });
  }

  Widget _bank(BuildContext context) {
    return Observer(builder: (_) {
      final financialInstitutions =
          authUserStore.authUser.financialInstitutions;

      Color color = Color.fromRGBO(182, 193, 207, 100);
      var cashIcon = IconPath.dollarCashGrey;
      var blockIcon = IconPath.block;
      String bankAccountText = 'Your Account';
      String buttonText = 'Add new Bank';
      if (authUserStore.authUser.connectedFinancialInstiutiton) {
        cashIcon = IconPath.dollarCashGreen;
        bankAccountText = financialInstitutions[0].name;
        buttonText = 'Disconnect Bank Account';
        color = Color(0xFF101827);
        blockIcon = IconPath.okIcon;
      }

      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                    bottom: ScreenUtil().setWidth(34),
                    left: ScreenUtil().setWidth(25)),
                height: 45,
                width: 69,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(182, 193, 207, 0.21), width: 0.5),
                    color: Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(19.4)),
                      child: IconButton(
                        icon: Image.asset(
                          cashIcon,
                          width: ScreenUtil().setWidth(120),
                          height: ScreenUtil().setHeight(120),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  bottom: ScreenUtil().setWidth(43.0),
                  left: ScreenUtil().setWidth(28)),
              child: Text(bankAccountText,
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AirbnbCerealApp',
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: ScreenUtil().setWidth(40),
                  left: ScreenUtil().setWidth(89)),
              child: IconButton(
                icon: Image.asset(
                  blockIcon,
                  width: 35,
                  height: 22,
                ),
                onPressed: () {},
              ),
            ),
          ]);
    });
  }

  Widget _payments(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        margin: EdgeInsets.only(
            top: ScreenUtil().setWidth(30.0),
            bottom: ScreenUtil().setWidth(30.0),
            left: ScreenUtil().setWidth(21),
            right: ScreenUtil().setWidth(21)),
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(53),
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(21)),
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
            Observer(
              builder: (_) {
                return Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(23),
                      left: ScreenUtil().setWidth(20)),
                  child: Text(
                    authUserStore.authUser.connectedFinancialInstiutiton
                        ? ''
                        : 'Connect your bank account to pay rent and to substitute proof of income and employment documents.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.48,
                        color: Color(0xFF3D475C),
                        fontFamily: 'AirbnbCerealApp'),
                  ),
                );
              },
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setWidth(45),
                  ),
                  margin: EdgeInsets.only(
                      bottom: ScreenUtil().setWidth(30),
                      left: ScreenUtil().setWidth(15),
                      right: ScreenUtil().setWidth(15),
                      top: ScreenUtil().setWidth(50)),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(243, 244, 248, 100), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: <Widget>[
                    _bank(context),
                    Observer(builder: (_) {
                      return Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setWidth(20)),
                          width: ScreenUtil().setWidth(600.5),
                          height: ScreenUtil().setHeight(74),
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(18)),
                          child: FlatButton(
                            color: Color(0xFFFFBA73),
                            onPressed: () async {
                              if (authUserStore
                                  .authUser.connectedFinancialInstiutiton) {
                                await authUserStore
                                    .disconnectFinancialInstitution(
                                        authUserStore
                                            .authUser
                                            .financialInstitutions[0]
                                            .financialInstitutionKey);
                              } else {
                                await authUserStore
                                    .connectFinancialInstitution(context);
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                                authUserStore
                                        .authUser.connectedFinancialInstiutiton
                                    ? 'Disconnect Account'
                                    : 'Add New Bank',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF7C4207),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'AirbnbCerealApp')),
                          ));
                    })
                  ]),
                )
              ],
            ),
            Divider(
              color: Color(0xFFF3F4F8),
              thickness: 1,
              indent: 11,
              endIndent: 11,
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(17)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(22)),
                      child: Text(
                        'Max. Monthly Spend',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AirbnbCerealApp'),
                      )),
                  Container(
                      margin:
                          EdgeInsets.only(left: ScreenUtil().setWidth(117.35)),
                      child: OutlineButton(
                        child: Text(
                          'Payment History',
                          style: TextStyle(
                            color: Color(0xFFDF8F3D),
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          print('ASD');
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        highlightedBorderColor: Colors.white,
                        borderSide: BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.8,
                        ),
                      ))
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(150),
              margin: EdgeInsets.only(
                  bottom: ScreenUtil().setWidth(30),
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(20)),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(243, 244, 248, 100), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil().setWidth(0),
                            right: ScreenUtil().setWidth(0),
                            left: ScreenUtil().setWidth(19)),
                        height: 45,
                        width: 69,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(182, 193, 207, 0.21),
                                width: 0.5),
                            color: Color(0xFFF6F7F9),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(19.4)),
                              child: IconButton(
                                icon: Image.asset(
                                  IconPath.dollarCashGreen,
                                  width: ScreenUtil().setWidth(120),
                                  height: ScreenUtil().setHeight(120),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        )),
                    Container(
                        margin:
                            EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                        child: Observer(
                          builder: (_) {
                            return authUserStore.authUser.monthlyRentalBudget !=
                                    null
                                ? Text(
                                    '\$'
                                    '${authUserStore.authUser.monthlyRentalBudget}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AirbnbCerealApp',
                                    ))
                                : Text('\$0',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AirbnbCerealApp',
                                    ));
                          },
                        )),
                    Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(0)),
                        height: 39,
                        width: ScreenUtil().setWidth(210),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(182, 193, 207, 0.21),
                                width: 2),
                            color: Color.fromRGBO(182, 193, 207, 0.21),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(45)),
                              child: Text('USD',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'AirbnbCerealApp',
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(0)),
                              child: PopupMenuButton<String>(
                                  onSelected: (String result) {},
                                  icon: Icon(Icons.arrow_drop_down),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                        const PopupMenuItem<String>(
                                            value: 'USD', child: Text('USD'))
                                      ]),
                            ),
                          ],
                        ))
                  ]),
            ),
            Container(
              height: ScreenUtil().setWidth(100),
              margin: EdgeInsets.only(
                  bottom: ScreenUtil().setWidth(30),
                  left: ScreenUtil().setWidth(21),
                  right: ScreenUtil().setWidth(20)),
              child: Text(
                  'Keep track of your expenses and access your payment history.',
                  style: TextStyle(
                      color: Color(0xFF3D475C),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'AirbnbCerealApp',
                      letterSpacing: -0.48)),
            ),
            Container(
                margin: EdgeInsets.only(
                    bottom: ScreenUtil().setWidth(30),
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(20)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21))),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFFE5CA),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: IconButton(
                        icon: Image.asset(
                          IconPath.info,
                          width: 17.3,
                          height: 17.8,
                          color: Color(0xFFDF8F3D),
                        ),
                        onPressed: () {},
                      )),
                      Text('This value is only seen by you!',
                          style: TextStyle(
                              color: Color(0xFFDF8F3D),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AirbnbCerealApp',
                              letterSpacing: -0.48))
                    ],
                  ),
                ))
          ],
        ));
  }
}
