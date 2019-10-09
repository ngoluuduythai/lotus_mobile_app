import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/widgets/bottom_navbar/bottom_navbar.dart';
class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("profile"), backgroundColor: Colors.red,),
      body: Text("test"),
      backgroundColor: Color(0xfff5f6fa),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}