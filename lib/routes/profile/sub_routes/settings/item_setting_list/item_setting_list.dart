import 'dart:core';
import 'package:flutter/material.dart';
import 'package:main/shared/constants/icon_paths.dart';

class ItemSettingList extends StatefulWidget {
  ItemSettingList({
    @required this.text,
    @required this.value,
    @required this.color,
    @required this.activeColor,
    @required this.onChanged,
  });

  final Function onChanged;
  final String text;
  final bool value;
  final Color color;
  final Color activeColor;

  @override
  _ItemSettingListState createState() => _ItemSettingListState();
}

class _ItemSettingListState extends State<ItemSettingList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            child: Text(widget.text,
                style: TextStyle(
                    fontFamily: 'AirbnbCerealApp',
                    fontSize: 18,
                    letterSpacing: -0.54,
                    color: widget.color))),
        Container(
            child: Switch(
                onChanged: widget.onChanged,
                value: widget.value,
                activeTrackColor: widget.activeColor,
                activeColor: widget.activeColor,
                activeThumbImage: AssetImage(IconPath.checkSwitch),
                inactiveThumbImage: AssetImage(IconPath.noCheckSwitch)))
      ],
    );
  }
}
