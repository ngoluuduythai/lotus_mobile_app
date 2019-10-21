import 'package:flutter_plaid/flutter_plaid.dart';
import 'package:flutter/material.dart';
import 'package:main/constants/env.dart';
import 'package:main/locator.dart';
import 'package:main/services/graphql.service.dart';

import "dart:async";
class PlaidService {
  final graphqlService = locator<GraphqlService>();
  Configuration configuration = Configuration(
    plaidPublicKey: ENV.plaidPublicKey,
    plaidBaseUrl: ENV.plaidBaseUrl,
    plaidEnvironment: ENV.plaidEnvironment,
    environmentPlaidPathAccessToken: ENV.plaidUrlAccessToken,
    environmentPlaidPathStripeToken: ENV.plaidUrlStripeToken,
    plaidClientId: ENV.plaidClientId,
    secret: ENV.plaidSecret
  );

  Future getBankToken(BuildContext context) async {
    Completer c = new Completer();
    FlutterPlaidApi flutterPlaidApi = FlutterPlaidApi(this.configuration);
    flutterPlaidApi.launch(context, (Result result) {
      c.complete(result);
    }, stripeToken: false);
    return c.future;
  }

  Future sendToken(String token) async {
    var result = await graphqlService.mutate(
        """
        mutation{
          connectBankAccount(
            token: "$token",
          ){
            message
          }
        }
        """
    );
    return result.data['connectBankAccount'];
  }

  Future addBank(BuildContext context) async {
    Result data = await getBankToken(context);
    final token = data.token;
    var res = await sendToken(token);
    print(res);

  }
}