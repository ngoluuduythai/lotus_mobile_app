import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    @required this.onPressed,
    @required this.iconImageLocation,
    @required this.buttonText,
    @required this.left,
    @required this.right,
    @required this.width,
    @required this.height,
    @required this.fontSize,
    this.buttonTextColor = const Color(0xff323332),
  });
  final Function onPressed;
  final String buttonText;
  final String iconImageLocation;
  final Color buttonTextColor;
  final double left;
  final double right;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return 
     
      Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: FlatButton(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(33.0)),
        onPressed: () async {
          return onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: left, right: right),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: Image.asset(iconImageLocation,
                        height: 21, width: 21, alignment: Alignment.center)),
               
                Text(buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: buttonTextColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'AirbnbCerealApp',
                        fontStyle: FontStyle.normal,
                        fontSize: fontSize)),
            
              
              ]),
        ),
      ),
    );

  }
}
