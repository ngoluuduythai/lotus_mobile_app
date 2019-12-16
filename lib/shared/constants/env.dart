import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final env = DotEnv().env;

class ENV {
  static String graphqlApiUrl = env['GRAPHQL_API_URL'];

  static String plaidPublicKey = env['PLAID_PUBLIC_KEY'];
  static String plaidBaseUrl = env['PLAID_BASE_URL'];
  static String plaidEnvironment = env['PLAID_ENVIRONMENT'];
  static String plaidUrlAccessToken = env['PLAID_URL_ACCESS_TOKEN'];
  static String plaidUrlStripeToken = env['PLAID_URL_STRIPE_TOKEN'];
  static String plaidClientId = env['PLAID_CLIENT_ID'];
  static String plaidSecret = env['PLAID_SECRET'];
  static String plaidWebhookUrl = env['PLAID_WEBHOOK_URL'];
  static String linkedinAppID = env['LINKEDIN_APP_ID'];
  static String linkedinRedirectUrl = env['LINKEDIN_REDIRECT_URL'];

  static bool isWeb = kIsWeb;
}
