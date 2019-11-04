import 'dart:async';
import 'package:plaid/plaid.dart';
import 'package:flutter/material.dart';
import '../constants/env.dart';
import 'package:main/locator.dart';
import './graphql.service.dart';

class PlaidService {
  final graphqlService = locator<GraphqlService>();
  Configuration configuration = Configuration(
      plaidPublicKey: ENV.plaidPublicKey,
      plaidBaseUrl: ENV.plaidBaseUrl,
      plaidEnvironment: ENV.plaidEnvironment,
      environmentPlaidPathAccessToken: ENV.plaidUrlAccessToken,
      environmentPlaidPathStripeToken: ENV.plaidUrlStripeToken,
      plaidClientId: ENV.plaidClientId,
      clientName: 'Lotus',
      secret: ENV.plaidSecret,
      webhook: ENV.plaidWebhookUrl,
      products: 'auth,income',
      selectAccount: 'true');

  Future getInstitutionToken(BuildContext context) async {
    Completer c = Completer();
    final FlutterPlaidApi flutterPlaidApi = FlutterPlaidApi(configuration);
    flutterPlaidApi.launch(context, (Result result) {
      c.complete(result);
    }, stripeToken: false);
    return c.future;
  }

  Future sendToken(String token, String accountId) async {
    final result = await graphqlService.mutate('''
        mutation{
          connectFinancialInstitution(
            token: "$token",
            accountId: "$accountId"
          ){
            message
          }
        }
       ''');
    return result.data;
  }

  Future connectInstitution(BuildContext context) async {
    final Result data = await getInstitutionToken(context);
    final token = data.token;
    final accountId = data.accountId;
    return sendToken(token, accountId);
  }
}
