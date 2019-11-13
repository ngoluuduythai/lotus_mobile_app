import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes/login/linkedin_view/linkedin_view.dart';
import 'package:main/shared/constants/env.dart';
import './graphql.service.dart';

class LinkedinService {
  final graphqlService = locator<GraphqlService>();

  Future<dynamic> login(BuildContext context) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(
                leading: CloseButton(),
              ),
              body: LinkedInLogin(
                clientId: ENV.linkedinAppID, // FIXME hardcoding
                redirectUrl: ENV.linkedinRedirectUrl,
                onError: (String error) {
                  print(error);
                },
                onAuthCode: (authCode) async {
                  final res =
                      await graphqlService.socialLogin(authCode, 'LINKEDIN');
                  Navigator.pop(context, res);
                },
              ))),
    );
    return res;
  }
}
