import 'package:flutter_plaid/flutter_plaid.dart';
import 'package:flutter/material.dart';
import 'package:main/constants/env.dart';
import "dart:async";
class PlaidService {

  Configuration configuration = Configuration(
    plaidPublicKey: ENV.plaidPublicKey,
    plaidBaseUrl: ENV.plaidBaseUrl,
    plaidEnvironment: ENV.plaidEnvironment,
    environmentPlaidPathAccessToken: ENV.plaidUrlAccessToken,
    environmentPlaidPathStripeToken: ENV.plaidUrlStripeToken,
    plaidClientId: ENV.plaidClientId,
    secret: ENV.plaidSecret
  );

  Future addBankAccount(BuildContext context) async {
    Completer c = new Completer();
    FlutterPlaidApi flutterPlaidApi = FlutterPlaidApi(this.configuration);
    flutterPlaidApi.launch(context, (Result result) {
      c.complete(result);
    }, stripeToken: false);
    return c.future;
  }
}