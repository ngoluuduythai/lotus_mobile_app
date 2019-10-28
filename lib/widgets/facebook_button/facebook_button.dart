import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';

class FacebookButton extends StatelessWidget {
  final Function afterLogin;
  FacebookButton({@required this.afterLogin});

  final AuthUserStore authUserStore = locator<AuthUserStore>();

  Future<void> onPressed() async {
    await authUserStore.loginFacebook();
    this.afterLogin();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(33.0)),
        onPressed: () async {
          return onPressed();
        },
        child: Text('Login With Facebook',
            style: TextStyle(
                color: const Color(0xff3b5998),
                fontWeight: FontWeight.w500,
                fontFamily: 'AirbnbCerealApp',
                fontStyle: FontStyle.normal,
                fontSize: 16.0)));
  }
}
