import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../../shared/store/auth_user/auth_user.store.dart';

class FacebookButton extends StatelessWidget {
  FacebookButton({@required this.afterLogin});
  final Function afterLogin;

  final AuthUserStore authUserStore = locator<AuthUserStore>();

  Future<void> onPressed() async {
    await authUserStore.loginFacebook();
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
            borderRadius: BorderRadius.circular(33.0)),
        onPressed: () async {
          return onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 50.0, right: 65.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: Image.asset('assets/images/facebookIcon.png',
                        height: 12,
                        width: 12, alignment: Alignment.topLeft)),
                Text('Login with Facebook',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff3b5998),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'AirbnbCerealApp',
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0))
              ]),
        ),
      ),
    );
  }
}
