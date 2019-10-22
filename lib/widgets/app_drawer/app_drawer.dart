import 'package:flutter/material.dart';
import 'package:main/responsive/orientatio_layout.dart';
import 'package:main/responsive/screen_type_layouts.dart';
import 'package:main/widgets/app_drawer/app_drawer_tablet.dart';
import 'package:main/widgets/drawer_options/drawer_options.dart';

import 'app_drawer_mobile.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait: AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),
    );
    
  }
  
  
  static List <Widget> getDrawerOptions(){

      return [
        DrawerOption(
           title:'Images',
           iconData: Icons.image,
        ),
         DrawerOption(
           title:'Images',
           iconData: Icons.image,
        ),
         DrawerOption(
           title:'Images',
           iconData: Icons.image,
        ),
      ];
    } 
}