import 'package:flutter/material.dart';
import 'package:linkedin_auth/linkedin_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Renders a [WebView] without a scaffold. One must provide a base view to render
/// the view. You can use a full page route and render it or use an Dialog. This view
/// will not render without a scaffold parent.
///
/// Programmatic Refresh tokens are available to only select partners to LinkedIn, so have been excluded from this library.
class LinkedInLogin extends StatefulWidget {
  /// Redirect Url provided to linkedIn developer console
  final String redirectUrl;

  /// Client ID from developer dashboard
  final String clientId;

  /// Custom callback for onError method, please provide one to get errors and do actions on them.
  final Function(String) onError;

  final Function(String) onAuthCode;

  /// Scopes to get access for, default scope would be [LinkedInScope.LITE_PROFILE] & [LinkedInScope.EMAIL_ADDRESS]
  /// Optional field, can be ignored for default behaviour.
  final List<LinkedInScope> scopes;

  LinkedInLogin(
      {@required this.redirectUrl,
      @required this.clientId,
      @required this.onError,
      this.onAuthCode,
      this.scopes});
  _LinkedInLoginViewState createState() => _LinkedInLoginViewState();
}

class _LinkedInLoginViewState extends State<LinkedInLogin> {
  static const _LINKEDIN_CODE = 'code';
  static const _LINKEDIN_STATE = 'state';
  static const _LINKEDIN_ERROR = 'error';
  static const _LINKEDIN_ERROR_DESC = 'error_description';
  LinkedInRequest _request;

  @override
  void initState() {
    super.initState();
    _request = LinkedInService.getLinkedInRequest(
      clientId: widget.clientId,
      redirectUri: widget.redirectUrl,
      scopes: widget.scopes != null
          ? widget.scopes
          : [LinkedInScope.EMAIL_ADDRESS, LinkedInScope.LITE_PROFILE],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _request.url,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: _navDelegate,
    );
  }

  /// Handles the navigation delegation for the [WebView]. If redirectUrl is found
  /// in the URL, then either locally client secret is to be provided depending on the
  /// [widget.bypassServerCheck] flag or a call is made separately to the server and parsed
  /// by the custom [widget.onServerResponse] method.
  ///
  /// On any error, navigation is prevented and error is returned in [widget.onError]
  ///
  /// On successful token capture, [widget.onTokenCapture] gets the data, from where,
  /// one must close the WebView.
  NavigationDecision _navDelegate(NavigationRequest req) {
    if (req.url.contains(widget.redirectUrl)) {
      Uri uri = Uri.parse(req.url);
      Map<String, String> params = uri.queryParameters;
      String error = _parseError(params);
      if (error.isNotEmpty) {
        widget.onError(error);
        return NavigationDecision.prevent;
      }
      if (params.containsKey(_LINKEDIN_STATE) &&
          !_request.verifyState(params[_LINKEDIN_STATE])) {
        widget.onError('State match failed, possible CSRF issue');
        return NavigationDecision.prevent;
      }
      if (params.containsKey(_LINKEDIN_CODE)) {
        widget.onAuthCode(params[_LINKEDIN_CODE]);
        return NavigationDecision.prevent;
      }
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  String _parseError(Map<String, String> params) {
    if (params.containsKey(_LINKEDIN_ERROR)) {
      return params[_LINKEDIN_ERROR_DESC];
    }
    return '';
  }
}
