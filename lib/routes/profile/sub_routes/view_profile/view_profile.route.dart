import 'package:flutter/material.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import '../../../../locator.dart';
import '../../../../shared/constants/icon_paths.dart';
import './../../../../routes.dart';
import '../../../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../../../shared/widgets/base_widget/base_widget.dart';
import '../../../../shared/widgets/bottom_navbar/bottom_navbar.dart';

class ViewProfileRoute extends StatefulWidget {
  @override
  _ViewProfileRouteState createState() => _ViewProfileRouteState();
}

class _ViewProfileRouteState extends State<ViewProfileRoute> {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

      greyDivider() {
    return Container(
      child: Divider(
        color:Color(0xFFB6C1CF),
        height: 60,
        indent: 22,
        endIndent: 22,
      ),
    );
  }


  
  @override
  Widget build(BuildContext context) {
   return BaseWidget( builder: (context, sizingInformation) {
   return BottomNavigationBase(
      child:
         ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                  Container(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                        Container(
                        margin: EdgeInsets.only(top: 32,left: 10),
                        child:
                        IconButton(
                        icon: Image.asset(
                          IconPath.backArrow,
                          width: 14,
                          height: 17,
                        ),
                        onPressed: () {
                          Routes.sailor.navigate(
                            RouteNames.profile,
                          );
                        },
                      ),
                          ),
                          Container(
                          margin: EdgeInsets.only(left: 290,top:25),  
                            child: InkWell(
                            child: Text('Edit',style:TextStyle(
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
                       Column(
                         children: <Widget>[
                         Container(
                          margin: EdgeInsets.only(top: 0,left: 0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(255, 186, 115, 1),
                                  width: 2),
                              shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain ,
                                  image: NetworkImage(
                                      '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                                )
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text( '${authUserStore.authUser.fullName}',style:TextStyle(
                            color: Color(0xff0b0b0b),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 21.0,
                            ),
                          ),
                          )
                          ,
                           Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text( '${authUserStore.authUser.location}',style:TextStyle(
                            color: Color(0xFFB6C1CF),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0,
                            ),
                          ),
                          )
                         ],
                       ) ,
                       Container(
                        margin:EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                         width: 372,
                        height: 600,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            children: <Widget>[
                            Container(
                            margin: EdgeInsets.only(top: 30,right: 210),
                            child:
                            Text("Hi, i' m "  '${authUserStore.authUser.firstName}',style:TextStyle(
                            color: Color(0xff0b0b0b),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                            ),)
                            ),
                              Container(
                            margin: EdgeInsets.only(top: 10,left: 22,right: 22),
                            child:
                            Text('Vestibulum rutrum quam vitae fringilla tincidunt. Suspendisse nec tortor urna. Ut laoreet sodales nisi, quis iaculis nulla iaculis vitae. ',style:TextStyle(
                            color: Color(0xFFB6C1CF),
                            fontWeight: FontWeight.w200,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0,
                            ),)
                            ),
                            greyDivider(),
                            Container(
                             margin: EdgeInsets.only(),
                             child: Row(
                               children: <Widget>[
                                 Container(
                                   margin: EdgeInsets.only(left: 20),
                                   child: Tab(icon: Image.asset(IconPath.verifiedAccount,width: 21,height: 21,)),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(left: 10),
                                   child: Text('Employer Verified',
                                     style:TextStyle(
                            color: Color(0xFF0B0B0B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0,
                                     )
                                   ),
                                 ),
                               ],
                             ),
                            ),
                            greyDivider(),
                            Container(
                            child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 188),
                                    child: Text('Lives in Brooklyn,NY',
                                     style:TextStyle(
                            color: Color(0xFFB6C1CF),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                                     )),
                                  ),
                                  Container(
                                     margin: EdgeInsets.only(right: 233,top: 10),
                                    child: Text('Speak English',
                                     style:TextStyle(
                            color: Color(0xFFB6C1CF),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                                     )),
                                  ),
                                  Container(  
                                     margin: EdgeInsets.only(right: 143,top: 10,),
                                    child: Text('Works at Graphic Designer',
                                     style:TextStyle(
                            color: Color(0xFFB6C1CF),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                                     )),
                                  )
                                ],

                            ),

                            ),
                             greyDivider(),
                            
                            Container(
                              
                              margin: EdgeInsets.only(right: 207),
                              child: Text('Tyler Provider',
                                     style:TextStyle(
                            color: Color(0xFF0B0B0B),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                                     ))
                            ),
                            Container(
                                child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 23,top: 3),
                                    child: Tab(icon: Image.asset(IconPath.okIcon,width: 14,height: 14,))
                                    ,
                                  ),
                                  Container(
                            margin: EdgeInsets.only(left: 10,top: 3),
                            child: Text('Goverment ID',style:TextStyle(
                            color: Color(0xFF0B0B0B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                                     )),
                                  ),
                                    Container(
                                    margin: EdgeInsets.only(left: 60,top: 3),
                                    child: Tab(icon: Image.asset(IconPath.okIcon,width: 14,height: 14,))
                                    ,
                                  ),
                                   Container(
                            margin: EdgeInsets.only(left: 8,top: 3),
                            child: Text('Selfie',style:TextStyle(
                            color: Color(0xFF0B0B0B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                                     )),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 23,top: 3),
                                    child: Tab(icon: Image.asset(IconPath.okIcon,width: 14,height: 14,))
                                    ,
                                  ),
                                  Container(
                            margin: EdgeInsets.only(left: 10,top: 3),
                            child: Text('Email Address',style:TextStyle(
                            color: Color(0xFF0B0B0B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                                     )),
                                  ),
                                    Container(
                                    margin: EdgeInsets.only(left: 60,top: 3),
                                    child: Tab(icon: Image.asset(IconPath.okIcon,width: 14,height: 14,))
                                    ,
                                  ),
                                   Container(
                            margin: EdgeInsets.only(left: 8,top: 3),
                            child: Text('Phone Number',style:TextStyle(
                            color: Color(0xFF0B0B0B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AirbnbCerealApp',
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                                     )),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                       ),
                       
              ],
      )
      );
  } );
}
} 