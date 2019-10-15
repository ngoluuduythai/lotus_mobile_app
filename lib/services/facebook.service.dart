import 'package:main/locator.dart';
import 'package:main/services/graphql.service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:main/models/auth_user.model.dart';
import 'package:flutter/services.dart';

class FacebookService {
  final _graphqlService = locator<GraphqlService>();

  sendAccessToken(String accessToken) async {
    var result = await _graphqlService.query(
        """
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
        """
    );
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
      var token = await getFacebookAccessToken();
      if(token == '') {
        return false;
      }

      print("Fetching data from api token:  ${token}");
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
