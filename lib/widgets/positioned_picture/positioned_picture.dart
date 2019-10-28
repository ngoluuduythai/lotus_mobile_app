import 'package:flutter/material.dart';

class PositionedPicture extends StatelessWidget {
  final String assetLocation;
  final double top;
  final double start;
  final double width;
  final double height;

  PositionedPicture(
      {this.assetLocation, this.top, this.start, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    print(this.assetLocation);
    return PositionedDirectional(
      top: top,
      start: start,
      child: Image.asset(
        assetLocation,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
