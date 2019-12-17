import 'dart:core';
import 'package:flutter/material.dart';

class ItemViewVerified extends StatefulWidget {
  ItemViewVerified({
    @required this.title,
    @required this.iconImageLocation,
    this.leftIcon,
    this.rightIcon,
    this.leftTitle,
    this.rightTitle,
    this.topIcon,
    this.topTitle,
    this.color = const Color(0xff0b0b0b),
  });

  String title;
  final String iconImageLocation;
  final Color color;
  double leftIcon;
  double rightIcon;
  double leftTitle;
  double rightTitle;
  double topIcon;
  double topTitle;

  @override
  _ItemViewVerified createState() => _ItemViewVerified();
}

class _ItemViewVerified extends State<ItemViewVerified> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding:
                  EdgeInsets.only(left: widget.leftIcon, top: widget.topIcon),
              child: Tab(
                  icon: Image.asset(
                widget.iconImageLocation,
                width: 14,
                height: 14,
              ))),
          Container(
              margin:
                  EdgeInsets.only(left: widget.leftTitle, top: widget.topTitle),
              child: Text(widget.title,
                  style: TextStyle(
                    color: Color(0xFF0B0B0B),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                  ))),
        ],
      ),
    );
  }
}
