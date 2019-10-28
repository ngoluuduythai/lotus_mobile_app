import 'package:flutter/material.dart';
import '../bottom_navbar/bottom_navbar.dart';

class BottomNavigationBase extends StatelessWidget {
  final Widget child;
  BottomNavigationBase({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: Color(0xfff5f6fa),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
