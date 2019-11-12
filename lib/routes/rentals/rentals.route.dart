import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../shared/constants/icon_paths.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import '../../shared/constants/images.dart';
class RentalsRoute extends StatelessWidget {
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
                  margin: EdgeInsets.only(top:20,right: 300),
                  child: Tab(icon: Image.asset(Images.logo),),width: 55,height: 33,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 32),
                  child: Text("Rentals", style: TextStyle(
                                            color: Color(0xff0b0b0b),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 21.0,
                                          )),
                ),
                Container(
                  child: Divider(thickness: 3,indent: 32,endIndent: 290,color: Color(0xFFFFBA73),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,left: 32),
                  child: Text("Applications", style: TextStyle(
                                            color: Color(0xff0b0b0b),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0,
                                          )),
                ),
                Container(
                  child: Divider(thickness: 3,indent: 32,endIndent: 343,color: Color(0xFFFFBA73),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 30,right: 20),
                  height: 144,
                  width: 372,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        child: Tab(icon: Image.asset(IconPath.keyIcon),),width: 44,height: 44,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 13),
                        child: Text("You have no pending applications", style: TextStyle(
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
                    margin: EdgeInsets.only(top: 35,left: 31),
                        child: Text("Current Place", style: TextStyle(
                                            color: Color(0xff0b0b0b),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0,
                                          )),
                      ),
                      Container(
                  child: Divider(thickness: 3,indent: 32,endIndent: 343,color: Color(0xFFFFBA73),),
                ),

                
                Container(
                  margin: EdgeInsets.only(left:30 ,right: 10,top: 10),
                  width: 283.2,
                  height: 177,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          width: 283.2,
                          height: 177,
                        decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: ExactAssetImage(Images.room01),alignment: Alignment.topCenter,
                        fit: BoxFit.contain,  
                        ),
                        ),
                      child: Container(
                        height: 177,
                        width: 283.2,
                      margin: EdgeInsets.only(top: 120),
                      child: 
                            Column(
                            
                            children:<Widget>[
                            Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10,bottom: 32),
                                child:
                                Text("Los Angeles •",style: TextStyle(
                                            color: Color(0xff0b0b0b),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.2,
                                          )),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 2,bottom: 32),
                                child:
                                Text("Move in May 22/19 - Mvo 30/19",style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 11.51,
                                          )),
                              ),
                              
                            ],
                      ),
                      Container(
                       margin: EdgeInsets.only(),
                        child:
                           Row(children: <Widget>[
                            Container(
                              child: Tab(icon: Image.asset(IconPath.locationIcon),),)
                      ],
                      )
                      ),
                     
                      ]
                        ),
                      )
                        ),
                        Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 283.2,
                        height: 177,
                        decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ],),
                ),

            ],
        ),
      );
    });
  }
}
