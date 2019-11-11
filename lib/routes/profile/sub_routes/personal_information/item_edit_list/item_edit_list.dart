import 'dart:core';
import 'package:flutter/material.dart';
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
                decoration: new InputDecoration.collapsed(
                  hintText: widget.valueOfHint,
                ),
                textAlign: TextAlign.center,
                onChanged: (String e) {
                  setState(() {
                     switch(widget.text){
      case 'First name:' : ItemEditList.user.firstname=e;
      if(ItemEditList.user.firstname==null){
          widget.authUserStore.authUser.firstName=widget.authUserStore.authUser.firstName;
      }else{
        widget.authUserStore.authUser.firstName=ItemEditList.user.firstname;
      }
      break;
      case 'Last name:' : ItemEditList.user.lastname=e;
      if(ItemEditList.user.lastname==null){
          widget.authUserStore.authUser.lastName=widget.authUserStore.authUser.lastName;
      }else{
          widget.authUserStore.authUser.lastName=ItemEditList.user.lastname;
      }
      break;
      case 'Gender:' : ItemEditList.user.gender=e;
      if(ItemEditList.user.gender==null){
          widget.authUserStore.authUser.gender=widget.authUserStore.authUser.gender;
      }else{
          widget.authUserStore.authUser.gender=ItemEditList.user.gender;
      }
      break;
      case 'Email:' : ItemEditList.user.email=e;
      if(ItemEditList.user.email==null){
          widget.authUserStore.authUser.email= widget.authUserStore.authUser.email;
      }else{
            widget.authUserStore.authUser.email=ItemEditList.user.email;
      }
      break;
      case 'Phone:' : ItemEditList.user.phone=e;
      if(ItemEditList.user.phone==null){
        widget.authUserStore.authUser.phone=widget.authUserStore.authUser.phone;
      }else{
           widget.authUserStore.authUser.phone=ItemEditList.user.phone;
      }
      break;
    }
                  });
                },
                  onSubmitted: (input) {
                  widget.newText = input;
      switch(widget.text){

      case 'First name:' : ItemEditList.user.firstname=widget.newText;
      if(ItemEditList.user.firstname==null){
         widget.authUserStore.authUser.firstName=widget.authUserStore.authUser.firstName;
      }else{
           widget.authUserStore.authUser.firstName=ItemEditList.user.firstname;
      }
      break;
      
      case 'Last name:' : ItemEditList.user.lastname=widget.newText;
       if(ItemEditList.user.lastname==null){
         widget.authUserStore.authUser.lastName=widget.authUserStore.authUser.lastName;
      }else{
           widget.authUserStore.authUser.lastName=ItemEditList.user.lastname;
      }
      break;
      case 'Gender:' : ItemEditList.user.gender=widget.newText;
       if(ItemEditList.user.gender==null){
         widget.authUserStore.authUser.gender=widget.authUserStore.authUser.gender;
      }else{
           widget.authUserStore.authUser.gender=ItemEditList.user.gender;
      }
      break;
      case 'Email:' : ItemEditList.user.email=widget.newText;
       if(ItemEditList.user.email==null){
         widget.authUserStore.authUser.email=widget.authUserStore.authUser.email;
      }else{
           widget.authUserStore.authUser.email=ItemEditList.user.email;
      }
      break;
      case 'Phone:' : ItemEditList.user.phone=widget.newText;
       if(ItemEditList.user.phone==null){
         widget.authUserStore.authUser.phone=widget.authUserStore.authUser.phone;
      }else{
           widget.authUserStore.authUser.phone=ItemEditList.user.phone;
      }
      break;
    }
      //switch(widget.text){
     // case 'First name:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));
     // break;
     // case 'Last name:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
     // break;
     // case 'Gender:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
    //  break;
    //  case 'Email:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
     // break;
     // case 'Phone:' : Navigator.push(context, MaterialPageRoute( builder: (context) => PersonalInformationRoute(user: ItemEditList.user,)));;
    //  break;
   // }
                  //    var response =widget.userService.editProfile(ItemEditList.user);
                  //    print(response);
                   //    if(ItemEditList.user.firstname==null){
                   //   }else{
                   //     widget.authUserStore.authUser.firstName=ItemEditList.user.firstname;
                    //  }
                   //    if(ItemEditList.user.lastname==null){
                   //   }else{
                   //     widget.authUserStore.authUser.lastName=ItemEditList.user.lastname;
                   //   }
                   //   if(ItemEditList.user.gender==null){
                   //   }else{
                   //    widget.authUserStore.authUser.gender=ItemEditList.user.gender;
                   //   }
                  //    if(ItemEditList.user.email==null){
                  //    }else{
                   //     widget.authUserStore.authUser.email=ItemEditList.user.email;
                   //   }
                    //  if(ItemEditList.user.phone==null){
                   //   }else{
                  //      widget.authUserStore.authUser.phone=ItemEditList.user.phone;
                  //    }
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
