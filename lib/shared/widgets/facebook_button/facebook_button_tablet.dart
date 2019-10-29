import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../../shared/store/auth_user/auth_user.store.dart';

class FacebookButtonTablet extends StatelessWidget {
  FacebookButtonTablet({@required this.afterLogin});
  final Function afterLogin;

  final AuthUserStore authUserStore = locator<AuthUserStore>();

  Future<void> onPressed() async {
    await authUserStore.loginFacebook();
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
          return onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 90, right: 70),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: new Image.asset("assets/images/facebookIcon.png",
                        width: 21, alignment: Alignment.topLeft)),
                Text('Login with Facebook',
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
