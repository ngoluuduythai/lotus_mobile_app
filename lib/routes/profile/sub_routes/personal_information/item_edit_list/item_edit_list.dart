import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../shared/models/auth_user.model.dart';
import '../../../../../locator.dart';
import '../../../../../routes.dart';

class ItemEditList extends StatefulWidget {
  @override
  ItemEditListState createState() => ItemEditListState();
  ItemEditList({
    @required this.text,
    @required this.text2,
    @required this.iconImageLocation,
    @required this.controller,
    this.color = const Color(0xff0b0b0b),
    this.color2,
    this.onTap,
    this.route,
  });

  final String text;
  String text2;
  final String iconImageLocation;
  final Function onTap;
  final Color color;
  final String route;
  final Color color2;
  TextField textField;
  TextEditingController controller;
  String newText;
}

class ItemEditListState extends State<ItemEditList> {
  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.text2;
    widget.newText = widget.controller.text;
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
                  hintText: widget.controller.text,
                ),
                textAlign: TextAlign.center,
                controller: widget.controller,
                onChanged: (String e) {
                  setState(() {
                    print(e);
                    widget.controller.text = e;
                    print(widget.controller.text);
                  });
                },
                onSubmitted: (input) {
                  widget.controller.text = input;
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

  void add(TextEditingController text, String text1) {
    text.text = text1;
    widget.text2 = text.text;
    widget.controller.text = text.text;
  }
}
