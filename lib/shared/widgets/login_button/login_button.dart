import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    @required this.onPressed,
    @required this.iconImageLocation,
    @required this.buttonText,
    this.buttonTextColor = const Color(0xff323332),
  });
  final Function onPressed;
  final String buttonText;
  final String iconImageLocation;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 45,
      alignment: Alignment.center,
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33.0)),
        onPressed: () async {
          return onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 50.0, right: 65.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Tab(
                    icon: Image.asset(iconImageLocation,
                        height: 21,
                        width: 21, alignment: Alignment.center)),
                Text(buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: buttonTextColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'AirbnbCerealApp',
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0))
              ]),
        ),
      ),
    );
  }
}
