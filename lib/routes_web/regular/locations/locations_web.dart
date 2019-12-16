import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import './locations_mobile_web.dart';
import './locations_desktop_web.dart';

class LocationsWebRoute extends StatelessWidget {
  LocationsWebRoute();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: LocationsMobileWebRoute(),
      tablet: LocationsDesktopWebRoute(),
    );
  }
}
