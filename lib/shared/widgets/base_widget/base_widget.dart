import 'package:flutter/material.dart';
import 'package:main/utils/ui_utils.dart';
//This base widget was created from this tutorial. Please watch to understand the power of this
//https://www.youtube.com/watch?v=z7P1OFLw4kY&feature=youtu.be

class BaseWidget extends StatelessWidget {
  BaseWidget({Key key, this.builder}) : super(key: key);
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxConstraints) {
      final sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
