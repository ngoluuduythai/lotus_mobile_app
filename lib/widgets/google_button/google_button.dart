import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_plaid/flutter_plaid.dart';

class GoogleButton extends StatelessWidget {
  final bool plaidSandbox = false;
  final authUserStore = locator<AuthUserStore>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

  final Function afterLogin;
  GoogleButton({@required this.afterLogin});

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

  Future<void> _handleSignIn() async {
    print('googleSignIn');
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      print('googleSignInAccount');
      print(googleSignInAccount);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      print('googleSignInAuthentication');
      print(googleSignInAuthentication);
    } catch (e) {
      print('error');
      print(e);
    }
    this.afterLogin();
  }

  // onPressed() async {
  //   // await authUserStore.login();
  //   print("signin with google");
  //   var res = await _googleSignIn.signIn();
  //   print("ress");
  //   print(res);
  //   var other = await res.authentication;
  //   print(other.idToken);
  //   print('other.idToken');

  //   // this.afterLogin();
  // }

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
