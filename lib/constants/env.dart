import 'dart:io';

class ENV {
  static String graphqlApiUrl = 'http://localhost:3000/graphql';
  // static String graphqlApiUrl = 'https://api.dev.lotus-pad.com/graphql';


  static String plaidPublicKey = '1f70dbfd258432e131c76f7068b279';
  static String plaidBaseUrl = 'https://cdn.plaid.com/link/v2/stable/link.html';
  static String plaidEnvironment = 'sandbox';
  static String environmentPlaidPathAccessToken = 
      'https://sandbox.plaid.com/item/public_token/exchange';
  static String environmentPlaidPathStripeToken = 
      'https://sandbox.plaid.com/processor/stripe/bank_account_token/create';
  static String plaidClientId = '5d32818ed3b983001272c8e8';
  static String plaidSecret = '2fc352efe7a0ecdfadf822365349ef';
}