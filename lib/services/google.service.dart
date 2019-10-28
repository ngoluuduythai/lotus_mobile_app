import 'package:google_sign_in/google_sign_in.dart';
import 'package:main/locator.dart';
import 'package:main/services/graphql.service.dart';

class GoogleService {
  final graphqlService = locator<GraphqlService>();
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: <String>['profile', 'email']);

  Future<dynamic> sendIdToken(String token) async {
    final dynamic result = await graphqlService.query('''
        query{
          socialLogin(
            token: "$token",
            platform: GOOGLE
          ){
            email
            firstName
            lastName
            token
          }
        }
        ''');
    return result.data['socialLogin'];
  }

  Future<String> getGoogleIdToken() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    return googleSignInAuthentication.idToken;
  }

  Future login() async {
    final String token = await getGoogleIdToken();
    if (token == null) {
      return false;
    }

    try {
      await sendIdToken(token);
    } catch (e) {
      print(e);
    }

    return true;
  }
}
