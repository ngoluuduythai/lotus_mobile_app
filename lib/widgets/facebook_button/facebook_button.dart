import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_plaid/flutter_plaid.dart';

class FacebookButton extends StatelessWidget {
  final authUserStore = locator<AuthUserStore>();
  var _googleSignIn = GoogleSignIn();
  bool plaidSandbox = false;

  final Function afterLogin;
  FacebookButton({@required this.afterLogin});

 showPlaidView(BuildContext context) async {
    bool plaidSandbox = true;
    
    Configuration configuration = Configuration(
        plaidPublicKey: '1f70dbfd258432e131c76f7068b279',
        plaidBaseUrl: 'https://cdn.plaid.com/link/v2/stable/link.html',
        plaidEnvironment: plaidSandbox ? 'sandbox' : 'production',
        environmentPlaidPathAccessToken:
            'https://sandbox.plaid.com/item/public_token/exchange',
        environmentPlaidPathStripeToken:
            'https://sandbox.plaid.com/processor/stripe/bank_account_token/create',
        plaidClientId: '5d32818ed3b983001272c8e8',
        secret: plaidSandbox ? '2fc352efe7a0ecdfadf822365349ef' : '');

    FlutterPlaidApi flutterPlaidApi = FlutterPlaidApi(configuration);
    flutterPlaidApi.launch(context, (Result result) {
      print("fetched plaid");
      print(result);
      ///handle result
    }, stripeToken: true);
  }

  onPressed() async {
    await authUserStore.loginFacebook();

    this.afterLogin();
  }
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(33.0)),
      onPressed: () async {
        // await showPlaidView(context);
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