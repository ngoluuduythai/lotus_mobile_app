import 'package:flutter/material.dart';

class ItemListProfile extends StatelessWidget {
  ItemListProfile({
    @required this.text,
    @required this.iconImageLocation,
    @required this.onTap,
    @required this.color,
  });

  final String text;
  final String iconImageLocation;
  final Function onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23.8, right: 20),
      height: 21,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontFamily: 'AirbnbCerealApp',
                fontStyle: FontStyle.normal,
                fontSize: 18.0,
              ),
            ),
            Tab(
                icon: Image.asset(
              iconImageLocation,
            )),
          ],
        ),
        onTap: () => onTap,
      ),
    );
  }
}
