import 'package:flutter_plaid/flutter_plaid.dart';
import 'package:flutter/material.dart';
import 'package:main/constants/env.dart';
import "dart:async";
class PlaidService {

  Configuration configuration = Configuration(
    plaidPublicKey: ENV.plaidPublicKey,
    plaidBaseUrl: ENV.plaidBaseUrl,
    plaidEnvironment: ENV.plaidEnvironment,
    environmentPlaidPathAccessToken: ENV.environmentPlaidPathAccessToken,
    environmentPlaidPathStripeToken: ENV.environmentPlaidPathStripeToken,
    plaidClientId: ENV.plaidClientId,
    secret: ENV.plaidSecret
  );

  Future<Result> addBankAccount(BuildContext context) async {
    Completer c = new Completer();
    FlutterPlaidApi flutterPlaidApi = FlutterPlaidApi(this.configuration);
    flutterPlaidApi.launch(context, (Result result) {
      print("fetched plaid");
      c.complete(result);
    }, stripeToken: true);
    return c.future;
  }
}