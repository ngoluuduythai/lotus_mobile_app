import 'package:flutter/material.dart';
import 'package:main/widgets/bank_widget/bank_widget.dart';
import 'package:main/widgets/profile_widget/profile_widget.dart';



 var condts = {
  1: ProfileWidget(),
  2: Row(),
  3: BankWidget(),
  4: Center(child: Text("")),
};

class WidgetByCondition extends StatelessWidget {
  final int index;
  WidgetByCondition(this.index);
  @override
  Widget build(BuildContext context) {
    return condts[index];
  }
}