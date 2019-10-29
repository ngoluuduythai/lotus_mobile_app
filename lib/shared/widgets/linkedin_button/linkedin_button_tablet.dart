import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../../shared/store/auth_user/auth_user.store.dart';

class LinkedinButtonTablet extends StatelessWidget {
  final bool plaidSandbox = false;
  final authUserStore = locator<AuthUserStore>();

  final Function afterLogin;
  LinkedinButtonTablet({@required this.afterLogin});

  Future<void> _handleSignIn() async {
    // await this.authUserStore.loginLinkedin();
    this.afterLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 55,
      alignment: Alignment.center,
      child: RaisedButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.0)),
        onPressed: () async {
          // await showPlaidView(context);
          return _handleSignIn();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 90, right: 90),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: new Image.asset("assets/images/linkedinIcon.png",
                        width: 22, alignment: Alignment.topLeft)),
                Text('Login with Linkedin',
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
