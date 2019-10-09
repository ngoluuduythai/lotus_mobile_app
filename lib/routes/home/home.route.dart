import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';

class HomeRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: 
        Stack(children: <Widget>
        [
          Container(
            width: 500,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
            height: 500,
            color: Colors.orange,
            child: Column(children: <Widget>[
              Text('Home'),
              Observer(
                builder: (_) => Text('Number of re-routes: ${authUserStore.count}'),
              ),
              RaisedButton(
                child: Text("Route to login"),
                onPressed: () {
                  authUserStore.increment();
                  print("Routing to login");
                  Routes.sailor('/login');
                },
              )
            ],)
          ),
        ],
      ),
    );
  }
}