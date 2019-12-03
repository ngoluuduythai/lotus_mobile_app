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
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: SubProfileBase(
        name: 'Payments',
        child: _payments(context),
      ));
    });
  }

  Widget _bank(BuildContext context) {
    authUserStore.getFinancialInstitutions();
    return Observer(builder: (_) {
      final authUser = authUserStore.authUser;
      final financialInstitutions = authUser.financialInstitutions;

      var cashIcon = IconPath.dollarCashGrey;
      String bankAccountText = 'Your Account';
      String buttonText = 'Add new Bank';
      if (authUserStore.authUser.connectedFinancialInstiutiton) {
        cashIcon = IconPath.dollarCashGreen;
        bankAccountText = financialInstitutions[0].name;
        buttonText = 'Disconnect Bank Account';
      }

      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                    bottom: ScreenUtil().setWidth(34)),
                height: 40,
                width: 55,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(182, 193, 207, 0.21), width: 2),
                    color: Color.fromRGBO(182, 193, 207, 0.21),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset(
                        cashIcon,
                        width: ScreenUtil().setWidth(25),
                        height: ScreenUtil().setHeight(16),
                      ),
                      onPressed: () {},
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  bottom: ScreenUtil().setWidth(43.0)),
              child: Text(bankAccountText,
                  style: TextStyle(
                    color: Color.fromRGBO(182, 193, 207, 100),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AirbnbCerealApp',
                  )),
            ),
            Container(
              margin: EdgeInsets.only( bottom: 43),
              child: IconButton(
                icon: Image.asset(
                  IconPath.block,
                  width: 25,
                  height: 16,
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
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
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
                  top: ScreenUtil().setWidth(16),
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
            Observer(builder: (_){
              final authUser = authUserStore.authUser;
              return Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(16),
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(21)),
              child: Text(authUserStore.authUser.connectedFinancialInstiutiton ? 
                  '': 
                  'Please Connect',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'AirbnbCerealApp',
                      letterSpacing: -0.48)),
            );
            },),
            Column(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(20)),
                  margin: EdgeInsets.only(
                      bottom: ScreenUtil().setWidth(35)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(243, 244, 248, 100), width: 2)),
                  child: Column(
                      children: <Widget>[
                        _bank(context),
                        Observer(builder: (_) {
                          final authUser = authUserStore.authUser;
                    
                          return Container(
                            width: ScreenUtil().setWidth(600),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(21)),
                            child: RaisedButton(
                              color: Color.fromRGBO(255, 186, 115, 1),
                              onPressed: () async {
                                if(authUserStore.authUser.connectedFinancialInstiutiton){
                                  await authUserStore.disconnectFinancialInstitution(authUser.financialInstitutions[0].financialInstitutionKey);
                        
                                } else {
                                  await authUserStore.connectFinancialInstitution(context);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(authUserStore.authUser.connectedFinancialInstiutiton ? 'Disconnect Bank' : 'Connect Bank',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'AirbnbCerealApp')),
                            ));
                        })
                      ]),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    child: Text(
                  'Max. Monthly Spend',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AirbnbCerealApp'),
                )),
                Container(
                    child: OutlineButton(
                  child: Text(
                    'Payment History',
                    style: TextStyle(color: Color.fromRGBO(223, 143, 61, 1)),
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
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setWidth(21),
                  bottom: ScreenUtil().setWidth(35)),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(243, 244, 248, 100), width: 2)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setWidth(21),
                            bottom: ScreenUtil().setWidth(14)),
                        height: 40,
                        width: 55,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(182, 193, 207, 0.21),
                                width: 2),
                            color: Color.fromRGBO(182, 193, 207, 0.21),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset(
                                IconPath.dollarCashGreen,
                                width: ScreenUtil().setWidth(25),
                                height: ScreenUtil().setHeight(16),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )),
                    Container(
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
                        height: 39,
                        width: 55,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(182, 193, 207, 0.21),
                                width: 2),
                            color: Color.fromRGBO(182, 193, 207, 0.21),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('USD',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ))
                  ]),
            ),
            Container(
                margin:EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21))),
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
        ));
  }
}
