import 'package:flutter/material.dart';
import 'package:main/responsive/orientation_layout.dart';
import 'package:main/responsive/screen_type_layouts.dart';
import 'package:main/widgets/drawer_options/drawer_option_mobile.dart';
import 'package:main/widgets/drawer_options/drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  DrawerOption({Key key, this.iconData, this.title}) : super(key: key);
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        landscape: DrawerOptionMobileLandscape(
          iconData: iconData,
        ),
        portrait: DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
        ),
      ),
      tablet: OrientationLayout(
        portrait: DrawerOptionTabletPortrait(
          title: title,
          iconData: iconData,
        ),
        landscape: DrawerOptionMobilePortrait(
          iconData: iconData,
          title: title,
        ),
      ),
    );
  }
}
