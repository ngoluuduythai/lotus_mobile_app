import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:main/shared/models/financial_institution.model.dart';
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
    final result = await graphqlService.query('''
    query{
      whoami{
        financialInstitutions{
          financialInstitutionKey
          name
        }
        monthlyRentalBudget
      }
    }
    ''');
    print(result.data['whoami']['monthlyRentalBudget']);
    return result.data['whoami'];
  }

  Future sendToken(Result plaidResult) async {
    final document = r'''
        mutation connectFinancialInstitution($input: ConnentFinancialInstitutionInput) {
          connectFinancialInstitution(
            input: $input
          ) {
            success
            financialInstitution{
              financialInstitutionKey
              name
            }
          }
        }
       ''';

    final MutationOptions _options = MutationOptions(
      document: document,
      variables: {
        'input': {
          'accountId': plaidResult.accountId,
          'token': plaidResult.token,
          'institutionId': plaidResult.institutionId,
          'institutionName': plaidResult.institutionName,
          'accountId': plaidResult.accountId,
          'accountName': plaidResult.accountName,
          'accountType': plaidResult.accountType,
          'accountSubtype': plaidResult.accountSubtype,
        }
      },
    );

    final result = await graphqlService.mutateOptions(_options);
    return result.data;
  }

  Future connectFinancialInstitution(BuildContext context) async {
    final Result result = await getInstitutionToken(context);
    return sendToken(result);
  }

  Future disconnectFinancialInstitution(int financialInstiutionKey) async {
    print('****** testinasdfasd');
    print(financialInstiutionKey);
    final document = r'''
      mutation removeFinancialInstitution($input: RemoveFinancialInstitutionInput) {
        removeFinancialInstitution(
          input: $input
        )
      }
      ''';

    final MutationOptions _options = MutationOptions(
      document: document,
      variables: {
        'input': {'financialInstitutionKey': financialInstiutionKey}
      },
    );

    final result = await graphqlService.mutateOptions(_options);
    print("** data");
    print(result.errors);
    return result.data;
  }
}
