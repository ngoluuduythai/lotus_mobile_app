import 'dart:async';
import 'package:plaid/plaid.dart';
import 'package:flutter/material.dart';
import '../constants/env.dart';
import 'package:main/locator.dart';
import './graphql.service.dart';
// import '../../pac/plaid.dart';

class FinancialService {
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
      selectAccount: 'false');

  Future getInstitutionToken(BuildContext context) async {
    Completer c = Completer();
    final FlutterPlaidApi flutterPlaidApi = FlutterPlaidApi(configuration);
    flutterPlaidApi.launch(context, (Result result) {
      c.complete(result);
    }, stripeToken: false);
    return c.future;
  }

  getInstitution() async {
    final result = await graphqlService.query('''query{
        whoami{
          userKey
          financialInstitutions{
            name
            financialInstitutionKey
          }
          monthlyRentalBudget
        }
      }''');
    print(result);
    return result.data;
  }

  Future sendToken(Result plaidResult) async {
    final result = await graphqlService.mutate('''
        mutation{
          connectFinancialInstitution(
            input: {
              token: "${plaidResult.token}"
              institutionId: "${plaidResult.institutionId}"
              institutionName: "${plaidResult.institutionName}"
              accountId: "${plaidResult.accountId}"
              accountName: "${plaidResult.accountName}"
              accountType: "${plaidResult.accountType}"
              accountSubtype: "${plaidResult.accountSubtype}"
            }
          ){
            success
          }
        }
       ''');
    return result.data;
  }

  Future connectFinancialInstitution(BuildContext context) async {
    final Result result = await getInstitutionToken(context);
    return sendToken(result);
  }
}
