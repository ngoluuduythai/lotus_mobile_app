import 'package:flutter/material.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import '../../../../locator.dart';
import 'widgets/main.dart';

class ViewProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  @override
  Widget build(BuildContext context) {
    authUserStore.getCurrentEmployer();
    return MainViewProfile();
  }
}
