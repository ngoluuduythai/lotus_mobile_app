import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/responsive/orientation_layout.dart';
import 'package:main/responsive/screen_type_layouts.dart';
import '../../locator.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import 'login.route.view.mobile.dart';
import 'login.route.view.tablet.dart';

class LoginRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  LoginRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Only showing in Portrait mode
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: LoginRouteMobilePortrait(),
        landscape: LoginRouteMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: LoginRouteTablet(),
        landscape: LoginRouteTablet(),
      ),
    );
  }
}
