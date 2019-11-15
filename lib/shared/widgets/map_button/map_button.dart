import 'package:flutter/material.dart';
import '../../../routes.dart';

class MapButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Text('gmaps'),
      onPressed: () => Routes.sailor.
        navigate(RouteNames.explore_map),
    );
  }
}
