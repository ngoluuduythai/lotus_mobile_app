import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemEditListAboutMe extends StatefulWidget {
  ItemEditListAboutMe({
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
  bool enable = true;

  @override
  _ItemEditListAboutMeState createState() => _ItemEditListAboutMeState();
}

class _ItemEditListAboutMeState extends State<ItemEditListAboutMe> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.userValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(153.9),
      margin: EdgeInsets.only(
          right: ScreenUtil().setWidth(60), top: ScreenUtil().setHeight(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.w700,
                fontFamily: 'AirbnbCerealApp',
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(36.0),
              ),
            ),
          ),
          Container(
              width: ScreenUtil().setWidth(540),
              margin: EdgeInsets.only(
                  top: ScreenUtil().setWidth(0),
                  left: ScreenUtil().setWidth(0),
                  right: ScreenUtil().setWidth(0)),
              child: TextField(
                style: TextStyle(
                    color: widget.color2,
                    fontSize: ScreenUtil().setSp(26.0),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AirbnbCerealApp'),
                maxLines: 2,
                enabled: widget.enable,
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
                decoration: InputDecoration(border: InputBorder.none),
              )),
        ],
      ),
    );
  }
}
