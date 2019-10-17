import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/store/auth_user/auth_user.store.dart';
import 'package:main/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:main/widgets/base_widget/base_widget.dart';
import 'package:main/widgets/add_bank_button/add_bank_button.dart';
import 'package:main/widgets/bottom_navigation_base/bottom_navigation_base.dart';


class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

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
                      child: new RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                      side:  BorderSide(color: Colors.transparent),
                      ),
                      child: Text('Info',
                      style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                      )
                      ), onPressed: () {},
                      ), opacity: 1.0,
                      ),
                     
                      new RaisedButton(    
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                      side:  BorderSide(color: Colors.transparent),
                      ),
                      child: Text('Friends',
                      style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                      ),
                      ), onPressed: () {},
                      ),

                      new RaisedButton(  
                      
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                      side:  BorderSide(color: Colors.transparent),
                      ),
                      child: Text('Bank',
                      style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,
                    )
                    ), onPressed: () {},
                    ),

                ],
                ),
                ),
                SizedBox(height: 16,),
                Expanded(child:
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  height: 200,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                // color: Colors.white,
                  child: Column(
                  children: <Widget>[
                    SizedBox(height: 16,),
                    Center(child:Text( "Connect your bank account to pay rent and to substitute proof of income and employment documents.",textAlign: TextAlign.center,)),
                    SizedBox(height: 5),
                    AddBankButtonButton(),
                   // RaisedButton(child: Text("login"),onPressed: () {
                   // Routes.sailor(RouteNames.login);
                   // },)
                    Divider(
                      color: Colors.grey,height: 30,
                      indent: 50,
                      endIndent: 50,
                    ),
                    Container(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      Text('Max.Monthly Spend',style:TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,),),
                          InkWell(
                            child: new Text("Payment History",style:TextStyle(color: Colors.amber
                            , fontWeight: FontWeight.w300,
                              fontFamily: "AirbnbCerealApp",
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.0,),
                            ),
                            onTap: ()=> something,
                          ),
                        ],),
                    ),
                     SizedBox(height: 5,),
                     
                     Container(    
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                      border:Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      ),
                      height: 50,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                      Tab(icon: new Image.asset("assets/images/cash.png")),

                      Text("2000",style:TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,)),

                      new DropdownButton<String>(
                      hint: Text("USD",style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AirbnbCerealApp",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0,)),
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                      );
                      }).toList(),
                      onChanged: (_) {},
                      ),
                      ],
                      ),
                    ),   
                     SizedBox(height: 10,),
                     Container(
                      height: 40,
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                      border:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange[100],
                      ),
                      child: Row(
                        children: <Widget>[
                          
                          Container(
                          margin: const EdgeInsets.only(left: 30.0, right: 10.0),
                          child:
                          Icon(Icons.info,color: Colors.amber),
                          ),
                        
                          Text("This value is only seen by you",style: TextStyle(color: Colors.amber),textAlign: TextAlign.center,)
                         
                          
                        ],
                      ),
                      ),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

void something (){

}