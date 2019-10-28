import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';

class StayRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
        child: Text('aasdf'),
      );
    });
  }
}
