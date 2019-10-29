import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  OrientationLayout({Key key, this.landscape, this.portrait}) : super(key: key);
  final Widget landscape;
  final Widget portrait;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landscape ?? portrait;
    }

    return portrait;
  }
}
