import 'package:flutter/material.dart';
import '../../../routes.dart';

class MapButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Image.asset(
        'assets/icons/shape.png'
      ),
      onPressed: () => Routes.sailor.
        navigate(RouteNames.explore_map),
    );
  }
}
