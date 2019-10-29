import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../../shared/store/auth_user/auth_user.store.dart';

class LinkedinButton extends StatelessWidget {
  final bool plaidSandbox = false;
  final authUserStore = locator<AuthUserStore>();

  final Function afterLogin;
  LinkedinButton({@required this.afterLogin});

  Future<void> _handleSignIn() async {
    // await this.authUserStore.loginLinkedin();
    this.afterLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 45,
      alignment: Alignment.center,
      child: RaisedButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.0)),
        onPressed: () async {
          return _handleSignIn();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 50.0, right: 80.0),
          alignment: Alignment.center,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: new Image.asset("assets/images/linkedinIcon.png",
                        width: 21, alignment: Alignment.topLeft)),
                Text('Login with Linkedin',
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
