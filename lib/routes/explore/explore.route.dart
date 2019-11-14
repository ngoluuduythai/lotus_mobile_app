import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import 'package:main/shared/constants/images.dart';
import 'package:main/shared/models/explore-card-model.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';
import 'explore_detail_card/explore_detail_card.dart';

class ExploreRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  final List<ExploreCardModel> cardDetailArray = []..add(ExploreCardModel(
      'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg',
      'New York',
      '3400',
      '2',
      '554 Sqtf'));
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: MaterialApp(
              home: Scaffold(
                  body: Container(
                      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                      color: Color.fromRGBO(245, 246, 250, 100),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(bottom: 17),
                                          child: Image.asset(
                                            Images.logo,
                                            width: 73,
                                            height: 45,
                                          ),
                                        ),
                                        Container(
                                          width: 66,
                                          height: 66,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 186, 115, 1),
                                                  width: 2),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                                                  )),
                                        ),
                                      ])),
                              Container(
                                child: Text(
                                    'Hello ${authUserStore.authUser.firstName},',
                                    style: TextStyle(
                                        fontSize: 21, letterSpacing: -0.63)),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Find the perfect space.\nSame price. No Commitment.',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'AirbnbCerealApp'))),
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text('Recommended Apartments',
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCerealApp',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: -0.48))),
                              Container(
                                  margin: EdgeInsetsDirectional.only(
                                      start: 0, end: 0, top: 5),
                                  height: 4.0,
                                  width: 50,
                                  color: Color.fromRGBO(255, 186, 115, 1)),
                              ExploreDetailCardRoute(
                                  cardDetailArray: cardDetailArray),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text('Featured Cities',
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCerealApp',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: -0.48))),
                              Container(
                                  child: Text(
                                      'Browse beautiful places to stay.',
                                      style: TextStyle(
                                          fontSize: 14, letterSpacing: -0.42))),
                              Container(
                                  margin: EdgeInsetsDirectional.only(
                                      start: 0, end: 0, top: 5),
                                  height: 4.0,
                                  width: 50,
                                  color: Color.fromRGBO(255, 186, 115, 1)),
                              _cityCarousel()
                            ]),
                      )))));
    });
  }

  Widget _cityCarousel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 144,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(29.2)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: 200,
                  height: 200,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text('New York',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontSize: 29,
                                  letterSpacing: -0.87)))))),
          SizedBox(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(29.2)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: 200,
                  height: 200,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text('New York',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontSize: 29,
                                  letterSpacing: -0.87)))))),
          SizedBox(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(29.2)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_474,q_75,w_640/v1/clients/newyorkstate/5232359e_e163_475c_abe3_0f20af112a8c_ae020bfc-a771-4564-87b7-479fbe55735d.jpg'),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: 200,
                  height: 200,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text('New York',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AirbnbCerealApp',
                                  fontSize: 29,
                                  letterSpacing: -0.87)))))),
        ],
      ),
    );
  }
}
