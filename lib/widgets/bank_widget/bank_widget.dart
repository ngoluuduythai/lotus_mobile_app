import 'package:flutter/material.dart';
import 'package:main/widgets/add_bank_button/add_bank_button.dart';

class BankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Expanded(child:
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
              );
  }
}
void something (){

}