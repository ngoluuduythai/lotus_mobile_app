import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:main/shared/constants/icon_paths.dart';
import '../../../../routes.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import '../../../../locator.dart';
import '../../../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../../../shared/widgets/base_widget/base_widget.dart';
import 'map.view.dart';

class ExploreMapRoute extends StatefulWidget {
  @override
  _ExploreMapRouteState createState() => _ExploreMapRouteState();
}

class _ExploreMapRouteState extends State<ExploreMapRoute> {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 32, left: 10),
                  child: IconButton(
                    icon: Image.asset(
                      IconPath.backArrow,
                      width: 14,
                      height: 17,
                    ),
                    onPressed: () {
                      Routes.sailor.navigate(
                        RouteNames.explore,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 290, top: 25),
                  child: InkWell(
                    child: Text('Map',
                        style: TextStyle(
                          color: Color(0xff0b0b0b),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AirbnbCerealApp',
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        )),
                  ),
                ),
              ],
            ),
          ),
          GoogleMapsView(
            // center: LatLng(45.521563, -122.677433),
          )
        ],
      ));
    });
  }
}
