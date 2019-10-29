import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../../shared/store/auth_user/auth_user.store.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({@required this.afterLogin});

  final bool plaidSandbox = false;
  final authUserStore = locator<AuthUserStore>();

  final Function afterLogin;

  Future<void> _handleSignIn() async {
    await authUserStore.loginGoogle();
    this.afterLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 45,
      alignment: Alignment.center,
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.0)),
        onPressed: () async {
          return _handleSignIn();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 50.0, right: 86.0),
          alignment: Alignment.center,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: new Image.asset("assets/images/googleIcon.png",
                        width: 21, alignment: Alignment.topLeft)),
                Text('Login with Google',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: const Color(0xff3b5998),
                        fontWeight: FontWeight.w500,
                        fontFamily: "AirbnbCerealApp",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0))
              ]),
        ),
      ),
    );
  }
}
