import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';

class ProfileWidget extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>(); 
  @override
  Widget build(BuildContext context) {
    return  new Expanded(
              child: new Container(
                padding: new EdgeInsets.all(13.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                height: 300.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                     child: new ListView(
                     children: <Widget>[
                     new Container(
                      height: 500.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                                Text("Hi, i'm "
                               '${this.authUserStore.authUser.firstName}',
                                style: TextStyle(
                                color:  Color(0xff0b0b0b),
                                fontWeight: FontWeight.w700,
                                fontFamily: "AirbnbCerealApp",
                                fontStyle:  FontStyle.normal,
                                fontSize: 18.0,
                                )
                                ),
                                SizedBox(height: 5,),  
                                Container(
                                child: Text("Vestibulum rutrum quam vitae fringilla tincidunt. Suspendisse nec tortor urna. Ut laoreet sodales nisi, quis iaculis nulla iaculis vitae. "
                                ,style:TextStyle( color:  Colors.grey[600],
                                 fontWeight: FontWeight.w200,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 16.0,)),
                                  ),  
                      SizedBox(height: 5,),
                      Divider( color: Colors.grey[600],height: 10,indent: 0,endIndent:0,), 
                                  Row(
                                  children: <Widget>[
                                  Container(
                                  margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                                  child:
                                  Tab(icon: new Image.asset("assets/images/shape.png",width: 21,)),
                                  ),
                                 Text("Employer Prefered",
                                 style:TextStyle( color:  Colors.black,
                                 fontWeight: FontWeight.w400,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 15.0,)),
                                 
                        ],
                      ),
                      Divider( color: Colors.grey[600],height: 10,indent: 0,endIndent:0,), 
                      SizedBox(height: 5,),
                     Container(
                                  height: 31,
                                  child: Text("Lives in Brooklyn , NY"
                                  ,style:TextStyle( color:  Colors.grey[600],
                                 fontWeight: FontWeight.w200,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 16.0,)),
                                  ),  
                                   Container(
                                     height: 31,
                                 child: Text("Speak English"
                                ,style:TextStyle( color:  Colors.grey[600],
                                 fontWeight: FontWeight.w200,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 16.0,)),
                                  ), 
                                 Container(
                                   height: 31,
                                 child: Text("Works at Graphic Designer"
                                 ,style:TextStyle( color:  Colors.grey[600],
                                 fontWeight: FontWeight.w200,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 16.0,)),
                                  ), 
                                  SizedBox(height: 1,),
                                  Divider( color: Colors.grey[600],height: 10,indent: 0,endIndent:0,), 
                                  SizedBox(height: 5,),
                                  Container(
                                    child: Text("Tyler Provided",
                                style: TextStyle(
                                color:  Color(0xff0b0b0b),
                                fontWeight: FontWeight.w700,
                                fontFamily: "AirbnbCerealApp",
                                fontStyle:  FontStyle.normal,
                                fontSize: 18.0,
                                ),
                                  ),
                                  ),
                                  SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                  Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child:
                                  Tab(icon: new Image.asset("assets/images/2B.png",width: 14,alignment: Alignment.centerLeft,)),
                                  ),
                                  Text("Government ID",
                                  textAlign: TextAlign.left,
                                 style:TextStyle( color:  Colors.black,
                                 fontWeight: FontWeight.w400,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 15.0,)),
                                 Container(
                                   margin: const EdgeInsets.only(left: 40.0, right: 10.0),
                                  child:
                                  Tab(icon: new Image.asset("assets/images/2B.png",width: 14,alignment: Alignment.topLeft)),
                                  ),
                                  Text("Selfie",
                                 style:TextStyle( color:  Colors.black,
                                 fontWeight: FontWeight.w400,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 15.0,)),
                        ],
                      ),
                      Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                  Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child:
                                  Tab(icon: new Image.asset("assets/images/2B.png",width: 14,alignment: Alignment.centerLeft,)),
                                  ),
                                  Text("Email Adresses",
                                  textAlign: TextAlign.left,
                                 style:TextStyle( color:  Colors.black,
                                 fontWeight: FontWeight.w400,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 15.0,)),
                                 Container(
                                   margin: const EdgeInsets.only(left: 40.0, right: 10.0),
                                  child:
                                  Tab(icon: new Image.asset("assets/images/2B.png",width: 14,alignment: Alignment.topLeft)),
                                  ),
                                  Text("Phone Number",
                                 style:TextStyle( color:  Colors.black,
                                 fontWeight: FontWeight.w400,
                                 fontFamily: "AirbnbCerealApp",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 15.0,)),
                        ],
                      ),
                        ]
                      )
                     )
                     ]
                     )
              )
    );
}
}