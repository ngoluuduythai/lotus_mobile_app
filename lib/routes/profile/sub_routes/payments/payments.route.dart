import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:main/shared/constants/icon_paths.dart';
import '../../../../routes.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import 'package:main/locator.dart';

class PaymentsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;
    String dropdownValue = 'USD';
    return MaterialApp(
        home: Scaffold(
            body: Row(children: <Widget>[
      Container(
          color: Color.fromRGBO(245, 246, 250, 100),
          width: size.width,
          height: h,
          padding: EdgeInsets.only(left: 20, top: 35, right: 20),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
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
                    Container(
                      margin: EdgeInsets.only(right: 120),
                      child: Text(
                        'Payment',
                        style: TextStyle(
                          color: Color(0xff0b0b0b),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AirbnbCerealApp',
                          fontStyle: FontStyle.normal,
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                  ]),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(21),
                              topRight: Radius.circular(21))),
                      width: size.width,
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: size.width,
                              padding:
                                  EdgeInsets.only(top: 10, left: 20, right: 30),
                              child: Text(
                                'Payments Method',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.54,
                                    fontFamily: 'AirbnbCerealApp'),
                              )),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 30, bottom: 20),
                            child: Text(
                                'Connect your bank account to pay rent and to substitute proof of income and employment documents.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'AirbnbCerealApp',
                                    letterSpacing: -0.48)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(243, 244, 248, 1)),
                                    left: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(243, 244, 248, 1)),
                                    right: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(243, 244, 248, 1)))),
                            child: Row(
                              children: [
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      height: 40,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  182, 193, 207, 0.21),
                                              width: 2),
                                          color: Color.fromRGBO(
                                              182, 193, 207, 0.21),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: IconButton(
                                        icon: Image.asset(
                                          IconPath.dollarCashGrey,
                                          width: 25,
                                          height: 16,
                                        ),
                                        onPressed: () {},
                                      )),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 30),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Your account',
                                        ),
                                        enabled: false,
                                      ),
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      child: Icon(Icons.do_not_disturb_on,
                                          color: Color.fromRGBO(
                                              182, 193, 207, 0.21))),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(243, 244, 248, 1)),
                                  left: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(243, 244, 248, 1)),
                                  right: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(243, 244, 248, 1))),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 40),
                            width: double.infinity,
                            child: RaisedButton(
                              color: Color.fromRGBO(255, 186, 115, 1),
                              onPressed: () async {
                                var connected = await authUserStore.connectInstitution(context);
                              },
                              child: Text('Add New Bank',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'AirbnbCerealApp')),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 20),
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
                          style:
                              TextStyle(color: Color.fromRGBO(223, 143, 61, 1)),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  width: size.width,
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(
                                  243,
                                  244,
                                  248,
                                  1,
                                ),
                                width: 2),
                            borderRadius: BorderRadius.circular(9)),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  height: 40,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              182, 193, 207, 0.21),
                                          width: 2),
                                      color:
                                          Color.fromRGBO(182, 193, 207, 0.21),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: IconButton(
                                    icon: Image.asset(
                                      IconPath.dollarCashGreen,
                                      width: 25,
                                      height: 16,
                                    ),
                                    onPressed: () {},
                                  )),
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('\$2000',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0,
                                          fontFamily: 'AirbnbCerealApp')),
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: CurrencyDropdown(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                color: Colors.white,
                width: size.width,
                padding:
                    EdgeInsets.only(top: 16, left: 20, right: 30, bottom: 20),
                child: Text(
                    'Keep track of your expenses and access your payment history.',
                    style: TextStyle(
                        color: Color.fromRGBO(61, 71, 92, 100),
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
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 30, bottom: 24),
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
          )),
    ])));
  }
}

class CurrencyDropdown extends StatefulWidget {
  CurrencyDropdown({Key key}) : super(key: key);

  @override
  _CurrencyDropdownState createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends State<CurrencyDropdown> {
  String dropdownValue = 'USD';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(246, 247, 249, 100),
      margin: EdgeInsets.only(right: 30),
      padding: EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        underline: Container(
          color: Colors.transparent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['USD', 'ARS', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
