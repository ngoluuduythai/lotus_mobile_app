import 'dart:core';
import 'package:flutter/material.dart';

class ItemEditList extends StatefulWidget {
  ItemEditList({
    @required this.title,
    @required this.iconImageLocation,
    @required this.onChanged,
    @required this.userValue,
    this.color = const Color(0xff0b0b0b),
    this.color2,
  });

  Function onChanged;
  String title;
  final String iconImageLocation;
  final Color color;
  final Color color2;
  String userValue;

  @override
  _ItemEditListState createState() => _ItemEditListState();
}

class _ItemEditListState extends State<ItemEditList> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.userValue;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23.8, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              widget.title,
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
                controller: _textEditingController,
                onChanged: (val) {
                  widget.onChanged(val);
                },
                onSubmitted: (val) {
                  setState(() {
                    _textEditingController.text = val;
                  });
                },
                // textAlign: TextAlign.center
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