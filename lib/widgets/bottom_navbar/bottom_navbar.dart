import 'package:flutter/material.dart';
import 'package:main/services/facebook.service.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:main/routes.dart';
import 'package:sailor/sailor.dart';

class BottomNavbar extends StatelessWidget {
  final navMap = {
    0: RouteNames.explore,
    1: RouteNames.saved,
    2: RouteNames.stays,
    3: RouteNames.inbox,
    4: RouteNames.profile
  };

  getRouteIndex(String route){
    var index;
    navMap.forEach((key, value) {
      if(value == route) {
        index = key;
      }
    });
    return index;
  }
  
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;
    final currentRouteIndex = this.getRouteIndex(currentRoute);
    return BottomNavigationBar(
      // selectedIconTheme: IconThemeData(color: Colors.red),
      // unselectedIconTheme: IconThemeData(color: Colors.red),
      unselectedItemColor: Color(0xffb6c1cf),
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Saved'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city),
          title: Text('Stays'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text('Inbox'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: currentRouteIndex,
      selectedItemColor: Color(0xffdf8f3d),
      onTap: (_){
        final newRoute = navMap[_];
        if(newRoute == currentRoute){

        } else {
          Routes.sailor.navigate(
            newRoute, 
            transitions: [SailorTransition.fade_in],
            transitionDuration: Duration(milliseconds: 200),
          );
        }
      });
  }
}