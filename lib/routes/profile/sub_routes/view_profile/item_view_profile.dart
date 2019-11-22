import 'dart:core';
import 'package:flutter/material.dart';

class ItemsViewProfile extends StatefulWidget {
  ItemsViewProfile({
    @required this.title,
    this.top,
    this.right,
  });

  String title;

  double top;
  double right;

  @override
  _ItemsViewProfile createState() => _ItemsViewProfile();
}

class _ItemsViewProfile extends State<ItemsViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: widget.right, top: widget.top),
      child: Text(widget.title,
          style: TextStyle(
            color: Color(0xFFB6C1CF),
            fontWeight: FontWeight.w400,
            fontFamily: 'AirbnbCerealApp',
            fontStyle: FontStyle.normal,
            fontSize: 15,
          )),
    );
  }
}
