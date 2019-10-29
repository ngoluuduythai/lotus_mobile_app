import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../../shared/store/auth_user/auth_user.store.dart';

class GoogleButtonTablet extends StatelessWidget {
  GoogleButtonTablet({@required this.afterLogin});

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
      width: 450,
      height: 55,
      alignment: Alignment.center,
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.0)),
        onPressed: () async {
          // await showPlaidView(context);
          return _handleSignIn();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 90, right: 100),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: new Image.asset("assets/images/googleIcon.png",
                        width: 22, alignment: Alignment.topLeft)),
                Text('Login with Google',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: const Color(0xff3b5998),
                        fontWeight: FontWeight.w500,
                        fontFamily: "AirbnbCerealApp",
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0))
              ]),
        ),
      ),
    );
  }
}
