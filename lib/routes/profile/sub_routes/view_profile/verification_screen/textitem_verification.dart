import 'dart:core';
import 'package:flutter/material.dart';

class TextItemVerification extends StatefulWidget {
  TextItemVerification({
    @required this.title,
    this.top,
    this.right,
    this.left,
    this.size,
  });

  String title;
  double top;
  double right;
  double left;
  double size;

  @override
  _TextItemVerification createState() => _TextItemVerification();
}

class _TextItemVerification extends State<TextItemVerification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: widget.right, top: widget.top, left: widget.left),
      child: Text(widget.title,
          style: TextStyle(
            color: Color(0xFF0B0B0B),
            fontWeight: FontWeight.w500,
            fontFamily: 'AirbnbCerealApp',
            fontStyle: FontStyle.normal,
            fontSize: widget.size,
          )),
    );
  }
}
