import 'package:flutter/material.dart';

class PositionedPicture extends StatelessWidget {
  PositionedPicture(
    {this.assetLocation, this.top, this.start, this.height, this.width});

  final String assetLocation;
  final double top;
  final double start;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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
