import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/add_bank_button/add_bank_button.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';

class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 63),
                width: 115,
                height: 115,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 1), width: 5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://picsum.photos/250?image=9') //eventually going to use facebook url
                        )),
              ),
              Container(
                margin: EdgeInsets.only(top: 17),
                child: Observer(
                    builder: (_) =>
                        Text('${authUserStore.authUser.fullName}',
                            style: TextStyle(
                              color: Color(0xff0b0b0b),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'AirbnbCerealApp',
                              fontStyle: FontStyle.normal,
                              fontSize: 21.0,
                            ))),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                // color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                            'Connect your bank account to pay rent and to substitute proof of income and employment documents.')),
                    AddBankButtonButton(),
                    RaisedButton(
                      child: Text('logout'),
                      onPressed: () async {
                        Routes.sailor(RouteNames.login);
                        await authUserStore.logout();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
