import 'package:flutter/material.dart';
import 'package:main/utils/ui_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final mediaQuery = MediaQuery.of(context);
      final sizingInformation = SizingInformation(
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
