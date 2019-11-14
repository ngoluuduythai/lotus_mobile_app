import 'package:flutter/material.dart';

class ExploreDetailCardRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 230,
                height: 150,
              ),
              Container(
                  width: 230,
                  height: 75,
                  padding: EdgeInsets.only(top: 15, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(21),
                          bottomRight: Radius.circular(21))),
                  child: Row(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Text('New York',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AirbnbCerealApp'))),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('\$3400/ Month. ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                              Container(
                                child: Text('• 2 Roms -  554 Sqft',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(117, 117, 117, 1),
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                            ],
                          ),
                        ])
                  ]))
            ],
          )),
          SizedBox(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 230,
                height: 150,
              ),
              Container(
                  width: 230,
                  height: 75,
                  padding: EdgeInsets.only(top: 15, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(21),
                          bottomRight: Radius.circular(21))),
                  child: Row(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Text('New York',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AirbnbCerealApp'))),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('\$3400/ Month. ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                              Container(
                                child: Text('• 2 Roms -  554 Sqft',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(117, 117, 117, 1),
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                            ],
                          ),
                        ])
                  ]))
            ],
          )),
          SizedBox(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 230,
                height: 150,
              ),
              Container(
                  width: 230,
                  height: 75,
                  padding: EdgeInsets.only(top: 15, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(21),
                          bottomRight: Radius.circular(21))),
                  child: Row(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Text('New York',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AirbnbCerealApp'))),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('\$3400/ Month. ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                              Container(
                                child: Text('• 2 Roms -  554 Sqft',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(117, 117, 117, 1),
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                            ],
                          ),
                        ])
                  ]))
            ],
          )),
          SizedBox(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 230,
                height: 150,
              ),
              Container(
                  width: 230,
                  height: 75,
                  padding: EdgeInsets.only(top: 15, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(21),
                          bottomRight: Radius.circular(21))),
                  child: Row(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Text('New York',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AirbnbCerealApp'))),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('\$3400/ Month. ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                              Container(
                                child: Text('• 2 Roms -  554 Sqft',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(117, 117, 117, 1),
                                        fontFamily: 'AirbnbCerealApp')),
                              ),
                            ],
                          ),
                        ])
                  ]))
            ],
          )),
        ],
      ),
    );
  }
}
