import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/constants/icon_paths.dart';
import './../../routes.dart';

class SubProfileBase extends StatelessWidget {
  SubProfileBase({@required this.name, @required this.child, this.save});
  String name;
  Widget child;
  Widget save;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 0,
                        right: ScreenUtil().setWidth(50),
                        top: ScreenUtil().setHeight(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset(
                            IconPath.backArrow,
                            width: ScreenUtil().setWidth(38),
                            height: ScreenUtil().setHeight(32),
                          ),
                          onPressed: () {
                            Routes.sailor.navigate(
                              RouteNames.profile,
                            );
                          },
                        ),
                        Container(
                            margin: EdgeInsets.only(),
                            child: GestureDetector(
                              child: Text(
                                name,
                                style: TextStyle(
                                  color: Color(0xff0b0b0b),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontStyle: FontStyle.normal,
                                  fontSize: ScreenUtil().setSp(42.0),
                                ),
                              ),
                              onTap: () =>
                                  Routes.sailor.navigate(RouteNames.profile),
                            )),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil()
                                    .setWidth(ScreenUtil().setWidth(670))),
                            child: save,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
