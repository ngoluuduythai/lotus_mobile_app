import 'dart:async';
import 'package:flutter/material.dart';
import '../../routes.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 500), _onShowLogin);
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void _onShowLogin() {
    if (mounted) {
      Routes.sailor.navigate('/login');
    }
  }
@override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.center,
    color: Colors.white,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
          'assets/images/logo.png', width: 112.0, height: 68.0,
        ),
    ),
  );
  }
}

 
