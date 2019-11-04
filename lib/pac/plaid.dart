import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterPlaidApi {
  FlutterPlaidApi(Configuration configuration) {
    _configuration = configuration;
  }
  Configuration _configuration;

  /// stripeToken = false use for get plaid token and accountId
  /// stripeToken = true: use for add the new payment method, returns stripe_token
  launch(BuildContext context, success(Result result),
      {bool stripeToken = false}) {
    final _WebViewPage _webViewPage = _WebViewPage();
    _webViewPage._init(_configuration, success, stripeToken, context);

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return _webViewPage.build(context);
    }));
  }
}

class _WebViewPage {
  String _url;
  Function(Result result) _success;
  Configuration _config;
  bool _stripeToken;
  BuildContext _context;

  _init(Configuration config, success(Result result), bool stripeToken,
      BuildContext context) {
    _success = success;
    _config = config;
    _stripeToken = stripeToken;
    _context = context;
    _url = config.plaidBaseUrl +
        '?key=' +
        config.plaidPublicKey +
        '&clientName='+ config.clientName +
        '&isWebview=' + config.isWebview +
        '&product=' + config.products +
        '&isMobile=' + config.isMobile +
        '&apiVersion=' + config.apiVersion +
        '&selectAccount=' + config.selectAccount +
        '&webhook=' + config.webhook +
        '&env=' +
        config.plaidEnvironment;
    debugPrint('init plaid: ' + _url);
  }

  _parseUrl(String url) {
    if (url?.isNotEmpty != null) {
      final Uri uri = Uri.parse(url);
      debugPrint('PLAID uri: ' + uri.toString());
      final Map<String, String> queryParams = uri.queryParameters;
      final List<String> segments = uri.pathSegments;
      debugPrint('queryParams: ' + queryParams?.toString());
      debugPrint('segments: ' + segments?.toString());
      _processParams(queryParams, url);
    }
  }

  _processParams(Map<String, String> queryParams, String url) async {
    if (queryParams != null) {
      final String eventName = queryParams['event_name'] ?? 'unknow';
      debugPrint('PLAID Event name:  $eventName');

      if (eventName == 'EXIT' || (url?.contains('/exit?') ?? false)) {
        _closeWebView();
      } else if (eventName == 'HANDOFF') {
        _closeWebView();
      }

      final dynamic token           = queryParams['public_token'];
      final dynamic accountId       = queryParams['account_id'];
      final String accountType      = queryParams['account_type'];
      final String accountSubtype   = queryParams['account_subtype'];
      final String accountName      = queryParams['account_name'];
      final String institutionId    = queryParams['institution_id'];
      final String institutionName  = queryParams['institution_name'];

      if (token != null && accountId != null) {
        if (!_stripeToken) {
          this._success(Result(
            token: token,
            accountId: accountId,
            accountName: accountName,
            accountType: accountType,
            accountSubtype: accountSubtype,
            institutionId: institutionId,
            institutionName: institutionName,
            response: queryParams
          ));
        } else {
          await _fetchStripeToken(token, accountId);
        }
      }
    }
  }

  _fetchStripeToken(String token, String accountId) async {
    final headers = {'Content-Type': 'application/json'};

    final Response responseAccessToken =
        await post(_config.environmentPlaidPathAccessToken,
            body: json.encode({
              'public_token': token,
              'client_id': _config.plaidClientId,
              'secret': _config.secret
            }),
            headers: headers);
    final accessTokenData =
        json.decode(utf8.decode(responseAccessToken.bodyBytes));
    final String accessToken = accessTokenData['access_token'];

    final Response responseStripeToken =
        await post(_config.environmentPlaidPathStripeToken,
            body: json.encode({
              'client_id': _config.plaidClientId,
              'secret': _config.secret,
              'access_token': accessToken,
              'account_id': accountId
            }),
            headers: headers);

    final stripeTokenData =
        json.decode(utf8.decode(responseStripeToken.bodyBytes));
    _success(Result(
      token:
        stripeTokenData['stripe_bank_account_token'], 
      response: stripeTokenData)
      );
  }

  _closeWebView() {
    if (_context != null && Navigator.canPop(_context)) {
      Navigator.pop(_context);
    }
  }

  Widget build(BuildContext context) {
    final webView = WebView(
      initialUrl: _url,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest navigation) {
        if (navigation.url.contains('plaidlink://')) {
          _parseUrl(navigation.url);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    );
    return Scaffold(body: webView);
  }
}

class Configuration {
  Configuration(
    {
    @required this.plaidPublicKey,
    @required this.plaidBaseUrl,
    @required this.plaidEnvironment,
    @required this.environmentPlaidPathAccessToken,
    @required this.environmentPlaidPathStripeToken,
    @required this.plaidClientId,
    @required this.secret,
    @required this.clientName,
    this.webhook        = 'https://requestb.in',
    this.products       = 'auth',//e.g. auth or auth,income
    this.selectAccount  = 'true',//e.g. auth or auth,income
    this.isMobile       = 'true',
    this.apiVersion     = 'v2',
    this.isWebview      = 'true',
  });
  String plaidPublicKey;
  String plaidBaseUrl;
  String plaidEnvironment;
  String environmentPlaidPathAccessToken;
  String environmentPlaidPathStripeToken;
  String plaidClientId;
  String secret;
  String clientName;
  String webhook;
  String products;
  String selectAccount;
  String apiVersion;
  String isMobile;
  String isWebview;
}

class Result {
  Result({
    @required this.response,
    @required this.token,
    this.accountId,
    this.accountType,
    this.accountSubtype,
    this.accountName,
    this.institutionId,
    this.institutionName,
  });
  dynamic response;
  String token;
  String accountId;
  String accountType;
  String accountSubtype;
  String accountName;
  String institutionId;
  String institutionName;
}
