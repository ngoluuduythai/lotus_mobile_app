import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/routes/rentals/item_rental.dart';
import '../../shared/constants/icon_paths.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import '../../shared/constants/images.dart';

class RentalsRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  orangeDivider(double thickness, double indent, double endIndent) {
    return Divider(
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: Color(0xFFFFBA73),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, right: 300),
              child: Tab(
                icon: Image.asset(Images.logo),
              ),
              width: 55,
              height: 33,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 32),
              child: Text('Rentals',
                  style: TextStyle(
                    color: Color(0xff0b0b0b),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0,
                  )),
            ),
            orangeDivider(3, 32, 290),
            Container(
              margin: EdgeInsets.only(top: 10, left: 32),
              child: Text('Applications',
                  style: TextStyle(
                    color: Color(0xff0b0b0b),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  )),
            ),
            orangeDivider(3, 32, 343),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 20),
              height: 144,
              width: 372,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    child: Tab(
                      icon: Image.asset(IconPath.keyIcon),
                    ),
                    width: 44,
                    height: 44,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: Text('You have no pending applications',
                        style: TextStyle(
                          color: Color(0xff0b0b0b),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'AirbnbCerealApp',
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35, left: 31),
              child: Text('Current Place',
                  style: TextStyle(
                    color: Color(0xff0b0b0b),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  )),
            ),
            orangeDivider(3, 32, 343),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 283.2,
              height: 177,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ItemRental(
                    imageRoute: Images.room01,
                    textLocation: 'New York •',
                    textDirection: 'Williamsburg, Brooklyn, NY',
                    iconRoute: IconPath.locationIcon,
                    textPrice: '\$' '100',
                    textDateArrived: 'Move in Aug 22',
                  ),
                  ItemRental(
                    imageRoute: Images.room01,
                    textLocation: 'New York •',
                    textDirection: 'Williamsburg, Brooklyn, NY',
                    iconRoute: IconPath.locationIcon,
                    textPrice: '\$' '100',
                    textDateArrived: 'Move in Aug 22',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35, left: 31),
              child: Text('Past Rentals',
                  style: TextStyle(
                    color: Color(0xff0b0b0b),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  )),
            ),
            orangeDivider(3, 32, 343),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 20),
              width: 283.2,
              height: 177,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ItemRental(
                    imageRoute: Images.room02,
                    textLocation: 'Los Angeles •',
                    textDirection: 'Williamsburg, Brooklyn, NY',
                    iconRoute: IconPath.locationIcon,
                    textPrice: '\$' '100',
                    textDateArrived: 'Move in May 22/19-Move out 30/19',
                  ),
                  ItemRental(
                    imageRoute: Images.room01,
                    textLocation: 'New York •',
                    textDirection: 'Williamsburg, Brooklyn, NY',
                    iconRoute: IconPath.locationIcon,
                    textPrice: '\$' '100',
                    textDateArrived: 'Move in Aug 22',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
