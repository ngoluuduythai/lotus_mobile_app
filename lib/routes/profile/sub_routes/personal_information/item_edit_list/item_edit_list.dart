import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:main/routes/profile/sub_routes/personal_information/personal_information.route.dart';
import 'package:main/shared/constants/env.dart';
import 'package:main/shared/models/auth_user.model.dart';
import '../../../../../locator.dart';
import '../../../../../shared/store/auth_user/auth_user.store.dart';
import '../../../../../shared/services/user.service.dart';
import '../user.dart';

class ItemEditList extends StatefulWidget {
  @override
  ItemEditListState createState() => ItemEditListState();
  ItemEditList({
    @required this.text,
    @required this.text2,
    @required this.iconImageLocation,
    this.color = const Color(0xff0b0b0b),
    this.color2,
    this.onTap,
    this.route,
  });
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  static AuthUser userEdit = AuthUser();
  UserService userService = UserService();
  String text;
  String text2;
  final String iconImageLocation;
  final Function onTap;
  final Color color;
  final String route;
  final Color color2;
  TextField textField;
  String newText;
  String valueOfHint;
  static User user = User();
  static var response;

}

class ItemEditListState extends State<ItemEditList> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
      
      switch(widget.text){
      case 'First name:' : widget.valueOfHint=widget.authUserStore.authUser.firstName;
      break;
      case 'Last name:' : widget.valueOfHint=widget.authUserStore.authUser.lastName;
      break;
      case 'Gender:' : widget.valueOfHint='Gender';
      break;
      case 'Email:' : widget.valueOfHint=widget.authUserStore.authUser.email;
      break;
      case 'Phone:' : widget.valueOfHint=widget.authUserStore.authUser.phone;
      break;
    }
=======
    _controller = TextEditingController(text: text2);

>>>>>>> 6317a29f23098958d1295152d738bf792224d7fe
    return Container(
      margin: EdgeInsets.only(left: 23.8, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.color,
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
<<<<<<< HEAD
                decoration: new InputDecoration.collapsed(
                  hintText: widget.valueOfHint,
                ),
=======
                decoration: InputDecoration.collapsed(hintText: ''),
>>>>>>> 6317a29f23098958d1295152d738bf792224d7fe
                textAlign: TextAlign.center,
                onChanged: (String e) {
                  setState(() {
                     switch(widget.text){
      case 'First name:' : ItemEditList.user.firstname=e;
      break;
      case 'Last name:' : ItemEditList.user.lastname=e;
      break;
      case 'Gender:' : ItemEditList.user.gender=e;
      break;
      case 'Email:' : ItemEditList.user.email=e;
      break;
      case 'Phone:' : ItemEditList.user.phone=e;
      break;
    }
                  });
                },
                  onSubmitted: (input) {
                  widget.newText = input;
      switch(widget.text){
      case 'First name:' : ItemEditList.user.firstname=widget.newText;
      break;
      case 'Last name:' : ItemEditList.user.lastname=widget.newText;
      break;
      case 'Gender:' : ItemEditList.user.gender=widget.newText;
      break;
      case 'Email:' : ItemEditList.user.email=widget.newText;
      break;
      case 'Phone:' : ItemEditList.user.phone=widget.newText;
      break;
    }
      switch(widget.text){
      case 'First name:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));
      break;
      case 'Last name:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
      break;
      case 'Gender:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
      break;
      case 'Email:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
      break;
      case 'Phone:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
      break;
    }
                      var response =widget.userService.editProfile(ItemEditList.user);
                     
                      print(ItemEditList.user.firstname);
                      print(ItemEditList.user.lastname);
                      print(ItemEditList.user.gender);
                      print(ItemEditList.user.email);
                      print(ItemEditList.user.phone);
                                  },
              )),
          Container(
              height: 21,
              width: 21,
              child: Tab(
                  icon: Image.asset(
                widget.iconImageLocation,
              ))),
        ],
      ),
    );
  }

}
