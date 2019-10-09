import 'package:flutter/material.dart';
import 'package:main/routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:main/widgets/facebook_button/facebook_button.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:main/constants/images.dart';
import 'package:main/widgets/positioned_picture/positioned_picture.dart';

part 'login.route.g.dart';

class LoginRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: 
        Stack(children: <Widget>[
          _TopRectable(),
          _BottomRectable(),
          // Container(
          //   width: 500,
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
          //   height: 500,
          //   color: Colors.red,
          //   child: Column(children: <Widget>[
          //     Text('Login'),
          //     FacebookButton(afterLogin: (){
          //       print("test");
          //     },),
          //     Observer(
          //       builder: (_) => Text('Number of re-routes: ${authUserStore.count}'),
          //     ),
          //     RaisedButton(
          //       child: Text("Route to home"),
          //       onPressed: () {
          //         print("Routing to home");
          //         Routes.sailor('/home');
          //         authUserStore.increment();
          //       },
          //     )
          //   ],)
          // ),
        ],
      ),
    );
  }
}

@widget
Widget _topRectable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double h = size.height * 3/5;
  return Container(
      width: size.width,
      height: h,
      color: Colors.white,
      child: Stack(children: <Widget>[
        _Welcome(),
      ],),
  );
}

@widget
Widget _bottomRectable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double topH = size.height * 3/5;
  double h = size.height-topH;

  return PositionedDirectional(
    top: topH,
    start: 0,
    child: Container(
      width: size.width,
      height: h,
      color: Color(0xffffba73),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FacebookButton(
            afterLogin: (){
              print("facebook after login");
              Routes.sailor(RouteNames.profile);
            },
          ),
      ],),
    ),
  );
}

@widget
Widget _welcome(BuildContext context) {
  return PositionedDirectional(
    top: 129,
    start: 42,
    child: Text(
      'Welcome to Lotus',
      style: TextStyle(
        color:  const Color(0xff0b0b0b),
        fontWeight: FontWeight.w700,
        fontFamily: "AirbnbCerealApp",
        fontStyle:  FontStyle.normal,
        fontSize: 30.0
      ),
    )
  );
}