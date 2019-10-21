import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';

class GoogleButton extends StatelessWidget {
  final bool plaidSandbox = false;
  final authUserStore = locator<AuthUserStore>();

  final Function afterLogin;
  GoogleButton({@required this.afterLogin});

  Future<void> _handleSignIn() async {
    this.authUserStore.loginGoogle();
    this.afterLogin();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.0)),
        onPressed: () async {
          return _handleSignIn();
        },
        child: Text('Login With Google',
            style: const TextStyle(
                color: const Color(0xff3b5998),
                fontWeight: FontWeight.w500,
                fontFamily: "AirbnbCerealApp",
                fontStyle: FontStyle.normal,
                fontSize: 16.0)));
  }
}
