import 'package:flutter/material.dart';
import '../shared/enums/device_screen_type.dart';
import '../shared/widgets/responsive_widget/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({
    Key key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);
  
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
          if (desktop != null) {
            return desktop;
          }
        }
        return mobile;
      },
    );
  }
}
