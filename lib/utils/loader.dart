import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';

Future<dynamic> overlayLoader({
  BuildContext context,
  Function asyncFunction,
  Color loaderColor = Colors.green,
  Color opacityColor = Colors.black,
  num opacity = .5,
}) async {
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntryOpacity = OverlayEntry(
    builder: (context) {
      return Opacity(
        opacity: opacity,
        child: Container(color: opacityColor,) 
      );
    }
  );
  OverlayEntry overlayEntryLoader = OverlayEntry(
    builder: (context) {
      return AwesomeLoader(
          loaderType: AwesomeLoader.AwesomeLoader3,
          color: loaderColor,
        );
    }
  );
  overlayState.insert(overlayEntryOpacity);
  overlayState.insert(overlayEntryLoader);

  final data = await asyncFunction();
  overlayEntryLoader.remove();
  overlayEntryOpacity.remove();
  return data;
}