import 'package:flutter/material.dart';
import 'package:main/services/facebook.service.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';

class FacebookButton extends StatelessWidget {
  final authUserStore = locator<AuthUserStore>();

  final Function afterLogin;
  FacebookButton({@required this.afterLogin});

  onPressed() async {
    await authUserStore.login();
    this.afterLogin();
  }
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(33.0)),
      onPressed: () async {
        return onPressed();
      },
      child:   Text(
        'Login With Facebook',
        style: const TextStyle(
            color:  const Color(0xff3b5998),
            fontWeight: FontWeight.w500,
            fontFamily: "AirbnbCerealApp",
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        )          
      )
    );
  }
}