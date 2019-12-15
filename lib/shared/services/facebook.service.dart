import 'package:main/locator.dart';
import 'package:main/shared/enums/social_login_enum.dart';
import './user.service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookService {
  final userService = locator<UserService>();

  Future<String> getFacebookAccessToken() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    String val;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        val = result.accessToken.token;
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }

    return val;
  }

  Future<dynamic> login() async {
    var token;
    try {
      token = await getFacebookAccessToken();
    } catch (err) {
      return null;
    }
    if (token == null) {
      return null;
    }
    return userService.socialLogin(token, SOCIAL_LOGIN_ENUM.FACEBOOK);
  }
}
