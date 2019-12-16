import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:main/locator.dart';
import '../../shared/enums/social_login_enum.dart';
import './user.service.dart';

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

class GoogleService {
  final userService = locator<UserService>();
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

    return userService.socialLogin(token, SOCIAL_LOGIN_ENUM.GOOGLE);
  }
}
