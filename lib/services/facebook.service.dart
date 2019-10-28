import 'package:main/locator.dart';
import 'package:main/services/graphql.service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookService {
  final graphqlService = locator<GraphqlService>();

  sendAccessToken(String accessToken) async {
    final result = await graphqlService.query('''
        query{
          socialLogin(
            token: "$accessToken",
            platform: FACEBOOK
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

  getFacebookAccessToken() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        return result.accessToken.token;
        break;
      case FacebookLoginStatus.cancelledByUser:
        return '';
        break;
      case FacebookLoginStatus.error:
        print(result);
        return '';
        break;
    }
  }

  login() async {
    final token = await getFacebookAccessToken();
    if (token == '') {
      return false;
    }
    var data;
    try {
      data = await sendAccessToken(token);
    } catch (e) {
      print(e);
    }

    print(data);
    return data;
  }
}
