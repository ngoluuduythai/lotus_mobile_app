import 'package:flutter/material.dart';
import 'package:main/shared/constants/colors.dart';

class CircularIndicator extends StatefulWidget {
  CircularIndicator({@required this.isLoading, bool visible});
  bool isLoading;
  Spinner createState() => Spinner(visible: isLoading);
}

class Spinner extends State {
  Spinner({@required this.visible});
  bool visible = false;

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: visible,
        child: Container(
            margin: EdgeInsets.only(top: 50, bottom: 30),
            child: CircularProgressIndicator(
      backgroundColor: AppColor.primary,
      strokeWidth: 5)));
  }
}
