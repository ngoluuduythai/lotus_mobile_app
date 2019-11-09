import 'package:flutter/material.dart';
import '../../../../../shared/services/user.service.dart';
import '../../../../../shared/models/auth_user.model.dart';
import '../../../../../locator.dart';
import '../../../../../routes.dart';

class ItemEditList extends StatelessWidget {
  ItemEditList({
    @required this.text,
    @required this.text2,
    @required this.iconImageLocation,
    this.color = const Color(0xff0b0b0b),
    this.color2,
    this.onTap,
    this.route,
  });

  final String text;
  final String text2;
  final String iconImageLocation;
  final Function onTap;
  final Color color;
  final String route;
  final Color color2;
  TextField textField;
  TextEditingController _controller;
  UserService userService = UserService();
  AuthUser user = AuthUser();

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController(text: text2);

    return Container(
      margin: EdgeInsets.only(left: 23.8, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontFamily: 'AirbnbCerealApp',
                fontStyle: FontStyle.normal,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
              width: 170,
              height: 20,
              margin: EdgeInsets.only(left: 10, right: 20),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: ''),
                textAlign: TextAlign.center,
                controller: _controller,
                onChanged: (text2) {
                  userService.editProfile(text2);
                },
              )),
          Container(
              height: 21,
              width: 21,
              child: Tab(
                  icon: Image.asset(
                iconImageLocation,
              ))),
        ],
      ),
    );
  }
}
