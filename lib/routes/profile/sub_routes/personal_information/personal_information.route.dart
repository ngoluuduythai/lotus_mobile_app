import 'package:flutter/material.dart';
import './../../../../routes.dart';

class PersonalInformationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Personal Information"),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: () {
                Routes.sailor.navigate(
                  RouteNames.profile,
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
