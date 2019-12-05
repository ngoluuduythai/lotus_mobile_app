import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main/shared/classes/gender_class.dart';
import 'package:main/shared/enums/gender_enum.dart';

class ItemEditListGender extends StatefulWidget {
  ItemEditListGender({
    @required this.title,
    @required this.iconImageLocation,
    @required this.onChanged,
    @required this.userValue,
    this.color = const Color(0xff0b0b0b),
    this.color2,
    this.fontSize,
  });

  Function onChanged;
  String title;
  final String iconImageLocation;
  final Color color;
  final Color color2;
  String userValue;
  bool enable = true;
  double fontSize;
  List<String> gender = <String>['Male', 'Female', ''];

  @override
  _ItemEditListGenderState createState() => _ItemEditListGenderState();
}

class _ItemEditListGenderState extends State<ItemEditListGender> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.userValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(19)),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(32)),
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
              width: ScreenUtil().setWidth(388),
              height: ScreenUtil().setHeight(82),
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(6),
                  left: ScreenUtil().setWidth(0),
                  right: ScreenUtil().setWidth(20)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                items: widget.gender
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(
                                color: widget.color2,
                                fontSize: ScreenUtil().setSp(26.0),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'AirbnbCerealApp'),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (selectedGender) {
                  widget.onChanged(selectedGender);
                  setState(() {
                    _textEditingController.text = selectedGender;
                  });
                },
                value: _textEditingController.text,
                isExpanded: true,
                hint: Text(_textEditingController.text),
              ))),
        ],
      ),
    );
  }
}
