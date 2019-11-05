import 'package:flutter/material.dart';
import '../../../../routes.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import 'package:main/locator.dart';

class PaymentsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Payments'),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Routes.sailor.navigate(
                  RouteNames.profile,
                );
              },
            ),
          ),
          RaisedButton(
            child: Text("connect bank account"),
            onPressed: () async {
              await authUserStore.connectInstitution(context);
            },
          )
        ],
      ),
    ));
  }
}
