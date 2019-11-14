import 'package:flutter/material.dart';
import 'package:main/shared/models/explore-card-model.dart';

class ExploreDetailCardRoute extends StatelessWidget {
  ExploreDetailCardRoute({@required this.cardDetailArray});
  final List<ExploreCardModel> cardDetailArray;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardDetailArray.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return SizedBox(
                child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21)),
                      image: DecorationImage(
                          image: NetworkImage(cardDetailArray[index].imageUrl),
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
                                child: Text(cardDetailArray[index].city,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AirbnbCerealApp'))),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text('\$${cardDetailArray[index].price}/ Month. ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'AirbnbCerealApp')),
                                ),
                                Container(
                                  child: Text('• ${cardDetailArray[index].roms} Roms -  ${cardDetailArray[index].direction}',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                              Color.fromRGBO(117, 117, 117, 1),
                                          fontFamily: 'AirbnbCerealApp')),
                                ),
                              ],
                            ),
                          ])
                    ]))
              ],
            ));
          }),
    );
  }
}
