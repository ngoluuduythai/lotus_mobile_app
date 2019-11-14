import 'package:flutter/material.dart';
import 'package:main/shared/models/explore-card-model.dart';

class ExploreSimpleCardRoute extends StatelessWidget {
  ExploreSimpleCardRoute({@required this.cardSimpleArray});
  final List<ExploreCardSimpleModel> cardSimpleArray;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 144,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardSimpleArray.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return SizedBox(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(29.2)),
                          image: DecorationImage(
                              image:
                                  NetworkImage(cardSimpleArray[index].imageUrl),
                              fit: BoxFit.cover)),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: 200,
                      height: 200,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(cardSimpleArray[index].city,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AirbnbCerealApp',
                                      fontSize: 29,
                                      letterSpacing: -0.87))))));
            }));
  }
}
