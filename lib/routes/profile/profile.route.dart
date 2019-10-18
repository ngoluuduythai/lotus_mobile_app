import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:main/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:main/widgets/base_widget/base_widget.dart';
import 'package:main/widgets/add_bank_button/add_bank_button.dart';
import 'package:main/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import 'package:main/widgets/tabPage_condition/tabPage_condition.dart';


class ProfileRoute extends StatefulWidget { 
  @override
  _ProfileRoute createState() => _ProfileRoute();
} 

  class _ProfileRoute extends State<ProfileRoute> {
  final AuthUserStore authUserStore = locator<AuthUserStore>(); 
        int tab=4;
  @override
  Widget build(BuildContext context) {
    
    return BaseWidget(builder: (context, sizingInformation) {
    
      return BottomNavigationBase(
        
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: <Widget>[
              Container(  
                margin: EdgeInsets.only(top: 63),
                width: 115,
                height: 115,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(255, 186, 115, 1),
                    width: 3
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/250?image=9')//eventually going to use facebook url
                  )
                ),

              ),

              Container(
                  margin: EdgeInsets.only(top: 17),
                  child: Observer(
                  builder: (_) => Text(
                    '${this.authUserStore.authUser.fullName}',
                    style: TextStyle(
                      color:  Color(0xff0b0b0b),
                      fontWeight: FontWeight.w700,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 21.0,
                    )
                  )   
                ),
              ),
              Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Observer(
                    builder: (_) => Text(
                      '${this.authUserStore.authUser.location}',
                      style: TextStyle(
                        color:  Color.fromARGB(220, 221, 219, 221),
                        fontWeight: FontWeight.w500,
                        fontFamily: "AirbnbCerealApp",
                        fontStyle:  FontStyle.normal,
                        fontSize: 13.0,
                        )
                        )   
                        ),
                        ),

                    SizedBox(
                    height: 20,
                            ),

                     Container( 
                     height: 50, 
                     decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                      ), 
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      Opacity(
                      child: new InkWell(
                      child: Text('Info',
                      style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                      ),
                      ),
                      onTap:  () {
                        setState(() {
                         tab=1;
                        });
                      }  
                      
                       

                      ), opacity: 1.0,
                      ),
                      VerticalDivider(
                         indent: 9,
                      endIndent: 9,
                      ),
                     
                      new InkWell(
                      child: Text('Friends',
                      style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                      ),
                      ), onTap: (){
                        setState(() {
                       tab=2;
                        });
                      },
                      ),
                          VerticalDivider(
                         indent: 9,
                      endIndent: 9,
                      ),
                      new InkWell(
                      child: Text('Bank',
                      style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                    )
                    ), onTap: () {
                        setState(() {
                                 tab=3;                  
                        });
                      },
                    ),

                ],
                
                ),
                
                ),
                SizedBox(height: 16,),                  

                ((tab==1)?WidgetByCondition(1): Container()),
                ((tab==2)?WidgetByCondition(2): Container()),
                ((tab==3)?WidgetByCondition(3): Container()),
                         
            ],
          ),
        ),
      );
    });
  }

}

