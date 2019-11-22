import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ItemVerification extends StatefulWidget {
  ItemVerification({
    @required this.left,
    @required this.right,
    @required this.onChanged,
    @required this.onFieldSubmitted,
    this.initialValue,
    this.width,
    this.keyboardType,
    this.controllerIncome,
    this.controllerEmail,
    this.isController,
  });
  bool isController;
  MoneyMaskedTextController controllerIncome;
  TextEditingController controllerEmail;
  double left;
  double right;
  double width;
  Function onChanged;
  TextInputType keyboardType;
  Function onFieldSubmitted;
  String initialValue;

  @override
  _ItemVerification createState() => _ItemVerification();
}

class _ItemVerification extends State<ItemVerification> {
  var _controller;

  void initState() {
    super.initState();
    if (widget.isController == true) {
      _controller = MoneyMaskedTextController();
      _controller.text = widget.controllerIncome.text;
    } else {
      _controller = TextEditingController(text: widget.controllerEmail.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.only(left: widget.left, right: widget.right),
      child: TextFormField(
          controller: _controller,
          keyboardType: widget.keyboardType,
          onChanged: (val) {
            widget.onChanged(val);
          },
          onFieldSubmitted: (val) {
            widget.onFieldSubmitted(val);
          },
          style: TextStyle(
            color: Color(0xFF484F61),
            fontWeight: FontWeight.w500,
            fontFamily: 'AirbnbCerealApp',
            fontStyle: FontStyle.normal,
            fontSize: 21.0,
          ),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFFF2F3F8),
              )),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF2F3F8)),
              ))),
    );
  }
}
