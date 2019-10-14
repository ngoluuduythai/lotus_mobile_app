import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:main/widgets/base_widget/base_widget.dart';
import 'package:main/widgets/bottom_navigation_base/bottom_navigation_base.dart';
class SavedRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
        child: Text("asdf"),
      );
    });
  }
}