import 'package:flutter/material.dart';
import 'package:main/responsive/orientation_layout.dart';
import 'package:main/responsive/screen_type_layouts.dart';
import '../../locator.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import 'login.route.view.mobile.dart';
import 'login.route.view.tablet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  LoginRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 750,
      height: 1334,
      allowFontScaling: true,
    )..init(context);


    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: LoginRouteMobilePortrait(),
      ),
      tablet: OrientationLayout(
        portrait: LoginRouteTablet(),
      ),
    );
  }
}
