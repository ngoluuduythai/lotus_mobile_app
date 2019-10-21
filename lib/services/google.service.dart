import 'package:google_sign_in/google_sign_in.dart';
import 'package:main/locator.dart';
import 'package:main/services/graphql.service.dart';

class GoogleService {
  final _graphqlService = locator<GraphqlService>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['profile', 'email']);

  sendIdToken(String token) async {
    var result = await _graphqlService.query("""
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
        """);
    return result.data['socialLogin'];
  }

  getGoogleIdToken() async {
    final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication; 
         
    return googleSignInAuthentication.idToken;
    
  }

  login() async {
    var token = await getGoogleIdToken();
    if (token == null) {
      return false;
    }

    print("Fetching data from api token:  ${token}");
    var data;
    try {
      data = await sendIdToken(token);
    } catch (e) {
      print(e);
    }

    print(data);
    return data;
  }
}
