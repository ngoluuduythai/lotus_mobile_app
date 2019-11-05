import 'package:google_sign_in/google_sign_in.dart';
import 'package:main/locator.dart';
import './graphql.service.dart';

class GoogleService {
  final graphqlService = locator<GraphqlService>();
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: <String>['profile', 'email']);

  Future<String> getGoogleIdToken() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    return googleSignInAuthentication.idToken;
  }

  Future<dynamic> login() async {
    final String token = await getGoogleIdToken();
    if (token == null) {
      throw 'Error #2: did not receive google token';
    }

    return graphqlService.socialLogin(token, 'GOOGLE');
  }
}
