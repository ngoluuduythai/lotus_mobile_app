import 'package:flutter/material.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/icon_paths.dart';

class ItemRental extends StatefulWidget {
  ItemRental({
    @required this.imageRoute,
    @required this.textLocation,
    @required this.textDirection,
    @required this.textDateArrived,
    @required this.textPrice,
    @required this.iconRoute,
  });

  String imageRoute,
      textLocation,
      textDirection,
      textDateArrived,
      textPrice,
      iconRoute;

  @override
  _ItemRentalState createState() => _ItemRentalState();
}

class _ItemRentalState extends State<ItemRental> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      width: 283.2,
      height: 177,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: ExactAssetImage(widget.imageRoute),
          alignment: Alignment.topCenter,
        ),
      ),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 120, left: 20),
              child: Text(
                widget.textLocation,
                style: TextStyle(
                  color: Color(0xFF0B0B0B),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AirbnbCerealApp',
                  fontStyle: FontStyle.normal,
                  fontSize: 14.2,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 123, left: 112),
                child: Text(widget.textDateArrived,
                    style: TextStyle(
                      color: Color(0xFF484F61),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'AirbnbCerealApp',
                      fontStyle: FontStyle.normal,
                      fontSize: 10.4,
                    ))),
            Container(
              margin: EdgeInsets.only(top: 130, left: 19),
              child: Tab(
                icon: Image.asset(
                  widget.iconRoute,
                  width: 16.8,
                  height: 14.2,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 143, left: 40),
                child: Text(
                  widget.textDirection,
                  style: TextStyle(
                    color: Color(0xFFE3A05A),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 12.4,
                    letterSpacing: -0.37,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 140, left: 230),
                child: Text(
                  widget.textPrice,
                  style: TextStyle(
                    color: Color(0xFF484F61),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'AirbnbCerealApp',
                    fontStyle: FontStyle.normal,
                    fontSize: 18.6,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
