import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:main/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:main/widgets/base_widget/base_widget.dart';
import 'package:main/widgets/add_bank_button/add_bank_button.dart';
import 'package:main/widgets/bottom_navigation_base/bottom_navigation_base.dart';

class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 200),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  // color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Center(child:Text( "Connect your bank account to pay rent and to substitute proof of income and employment documents.")),
                      AddBankButtonButton(),
                      RaisedButton(child: Text("login"),onPressed: () {
                        Routes.sailor(RouteNames.login);
                      },)
                    ],
                  ),
                )
              ),
              
            ],
          ),
        ),
      );
    });
  }
}