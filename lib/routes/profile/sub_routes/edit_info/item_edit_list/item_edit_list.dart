import 'dart:core';
import 'dart:core' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemEditList extends StatefulWidget {
  ItemEditList({
    @required this.title,
    @required this.iconImageLocation,
    @required this.onChanged,
    @required this.onSubmited,
    @required this.userValue,
    this.color = const Color(0xff0b0b0b),
    this.color2,
    this.fontSize,
  });

  Function onChanged;
  Function onSubmited;
  String title;
  final String iconImageLocation;
  final Color color;
  final Color color2;
  String userValue;
  bool enable = true;
  double fontSize;
  double left;
  double right;

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
    widget.left = 0;
    widget.right = 0;
    widget.enable = isEmail(widget.title);
    widget.fontSize = isNickName(widget.title);
    isPhone(widget.title);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(45)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(35)),
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
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(82),
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(6),
                  left: ScreenUtil().setWidth(widget.left),
                  right: ScreenUtil().setWidth(widget.right)),
              child: isEmail(widget.title)
                  ? TextField(
                      style: TextStyle(
                          color: widget.color2,
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'AirbnbCerealApp'),
                      maxLines: 1,
                      enabled: widget.enable,
                      controller: _textEditingController,
                      onChanged: (val) {
                        widget.onChanged(val);
                      },
                      onSubmitted: (val) {
                        widget.onSubmited(val);
                      },
                      // textAlign: TextAlign.center
                      decoration: InputDecoration(border: InputBorder.none),
                    )
                  : FittedBox(
                      child: Text(
                        widget.userValue,
                        style: TextStyle(
                            color: widget.color2,
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp'),
                      ),
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                    )),
          Container(
              height: ScreenUtil().setHeight(42),
              width: ScreenUtil().setWidth(42),
              child: GestureDetector(
                child: Tab(
                    icon: Image.asset(
                  widget.iconImageLocation,
                )),
                onTap: () => {
                  setState(() {
                    if (isEmail(widget.title)) _textEditingController.text = '';
                  })
                },
              )),
        ],
      ),
    );
  }

  bool isEmail(String text) {
    print(text);
    if (text == 'Email:') {
      widget.left = 83;
      return false;
    } else {
      return true;
    }
  }

  isPhone(String text) {
    if (text == 'Phone:') {
      widget.left = 59;
    }
  }

  double isNickName(String text) {
    print(text);
    if (text == 'Nickname:') {
      return 17;
    }
    return 16;
  }
}
